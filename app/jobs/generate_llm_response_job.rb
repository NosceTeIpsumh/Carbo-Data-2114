class GenerateLlmResponseJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: 5.seconds, attempts: 2, except: [Timeout::Error]

  SYSTEM_PROMPT = MessagesController::SYSTEM_PROMPT

  def perform(chat_id:, user_message_content: nil, generate_title: true)
    @chat = Chat.find(chat_id)
    @message = @chat.messages.create!(role: "assistant", content: "")

    broadcast_typing_indicator

    full_content = ""

    Timeout.timeout(30) do
      ruby_llm_chat = RubyLLM.chat
      build_conversation_history(ruby_llm_chat)

      prompt = user_message_content || "Give an idea of recipe"

      ruby_llm_chat.with_instructions(instructions).ask(prompt) do |chunk|
        next if chunk.content.nil?

        full_content += chunk.content
        broadcast_chunk(chunk.content, full_content)
      end
    end

    @message.update!(content: full_content)
    @chat.generate_title_from_first_message if generate_title
    broadcast_complete

  rescue Timeout::Error
    Rails.logger.error("LLM Job timed out for chat #{chat_id}")
    handle_error("La réponse a pris trop de temps. Veuillez réessayer.")
  rescue StandardError => e
    Rails.logger.error("LLM Job failed for chat #{chat_id}: #{e.class} - #{e.message}")
    handle_error("Une erreur s'est produite. Veuillez réessayer.")
    raise
  end

  private

  def build_conversation_history(ruby_llm_chat)
    @chat.messages.where.not(id: @message.id).each do |message|
      ruby_llm_chat.add_message({ role: message.role, content: message.content })
    end
  end

  def my_items
    items = @chat.chat_items.map(&:item)
    return nil if items.empty?

    names = items.map(&:name)
    ratio_glucide = items.map(&:ratio_glucide)
    indice_gly = items.map(&:indice_gly)
    "Here are the ingredients the user wants to include in the recipe: #{names}, #{ratio_glucide}, #{indice_gly}."
  end

  def instructions
    [SYSTEM_PROMPT, my_items].compact.join("\n\n")
  end

  def handle_error(error_message)
    @message.update!(content: error_message) if @message&.persisted?
    broadcast_complete
  end

  def broadcast_chunk(chunk_content, full_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "chat_#{@chat.id}",
      target: "message_#{@message.id}_content",
      html: ApplicationController.helpers.markdown(full_content)
    )
  end

  def broadcast_typing_indicator
    Turbo::StreamsChannel.broadcast_append_to(
      "chat_#{@chat.id}",
      target: "messages",
      partial: "messages/message",
      locals: { message: @message, chat: @chat }
    )
  end

  def broadcast_complete
    Turbo::StreamsChannel.broadcast_replace_to(
      "chat_#{@chat.id}",
      target: "message_#{@message.id}",
      partial: "messages/message",
      locals: { message: @message, chat: @chat }
    )

    # Also update the chat title if it changed
    Turbo::StreamsChannel.broadcast_update_to(
      "chat_#{@chat.id}",
      target: "chat_title",
      html: @chat.reload.title
    )
  end
end

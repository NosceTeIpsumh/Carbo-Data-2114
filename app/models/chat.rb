class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :chat_items, dependent: :destroy

  DEFAULT_TITLE = ""
  TITLE_PROMPT = <<~PROMPT
    Generate the title of the recipe you proposed to the user
  PROMPT
  def generate_title_from_first_message
    return unless title.blank? || title == DEFAULT_TITLE

    first_bot_message = messages.where(role: "assistant").order(:created_at).first
    return if first_bot_message.nil?

    response = RubyLLM.chat.with_instructions(TITLE_PROMPT).ask(first_bot_message.content)
    update(title: response.content.strip)
  end
end

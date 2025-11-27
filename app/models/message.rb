class Message < ApplicationRecord
  belongs_to :chat
  after_create_commit :broadcast_append_to_chat

  private

  def broadcast_append_to_chat
    broadcast_append_to chat, target: "messages", partial: "messages/message", locals: { message: self, chat: chat }
  end
end

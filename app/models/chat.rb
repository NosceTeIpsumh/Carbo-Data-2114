class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :chat_items
end

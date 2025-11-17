class Item < ApplicationRecord
  belongs_to :user
  has_many :recipe_items
  has_many :chat_items
end

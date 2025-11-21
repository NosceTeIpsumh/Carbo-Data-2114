class Item < ApplicationRecord
  belongs_to :user
  has_many :recipe_items, dependent: :destroy
  has_many :chat_items, dependent: :destroy

  def show_name_and_brand
    "#{name} - #{brand}"
  end
end

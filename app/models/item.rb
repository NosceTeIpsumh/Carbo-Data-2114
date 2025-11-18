class Item < ApplicationRecord
  belongs_to :user
  has_many :recipe_items
  has_many :chat_items

  def show_name_and_brand
    "#{name} - #{brand} : #{indice_gly} IG"
  end
end

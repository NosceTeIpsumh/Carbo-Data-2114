class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :recipe_items, dependent: :destroy
  has_many :chat_items, dependent: :destroy

  multisearchable against: [:name, :brand, :category, :ratio_glucide, :indice_gly]

  def show_name_and_brand
    "#{name} - #{brand}"
  end
end

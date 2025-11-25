class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :recipe_items, dependent: :destroy
  has_many :chat_items, dependent: :destroy

  has_one_attached :photo

  pg_search_scope :search_by_name_description_difficulty_indice_gly, {
    against: {name: 'A', brand: 'B', category: 'B', indice_gly: 'B', ratio_glucide: 'B'},
    using: {
      tsearch: { prefix: true }
    }
  }

  multisearchable against: [:name, :brand, :category, :ratio_glucide, :indice_gly]

  def show_name_and_brand
    "#{name} - #{brand}"
  end
end

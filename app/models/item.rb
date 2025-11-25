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

  def gi_level
    return 'low' if indice_gly < 55
    return 'medium' if indice_gly <= 70
    'high'
  end

  def gi_stars
    return 5 if indice_gly < 40
    return 4 if indice_gly < 55
    return 3 if indice_gly < 70
    return 2 if indice_gly < 85
    1
  end

  def carb_stars
    return 5 if ratio_glucide < 20
    return 4 if ratio_glucide < 35
    return 3 if ratio_glucide < 50
    return 2 if ratio_glucide < 65
    1
  end
end

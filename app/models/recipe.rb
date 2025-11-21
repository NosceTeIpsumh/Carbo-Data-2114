class Recipe < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :recipe_items

  multisearchable against: [:name, :description, :ratio_glucide, :indice_gly, :difficulty]
end

class RecipeItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :item
end

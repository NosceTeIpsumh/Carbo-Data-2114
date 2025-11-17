class CreateRecipeItems < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_items do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end

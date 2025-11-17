class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :steps
      t.integer :difficulty
      t.integer :indice_gly
      t.integer :ratio_glucide
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

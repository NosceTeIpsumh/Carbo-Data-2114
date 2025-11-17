class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :category
      t.integer :indice_gly
      t.integer :ratio_glucide
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

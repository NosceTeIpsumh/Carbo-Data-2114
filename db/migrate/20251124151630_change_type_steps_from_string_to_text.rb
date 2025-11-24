class ChangeTypeStepsFromStringToText < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :steps, :text
  end
end

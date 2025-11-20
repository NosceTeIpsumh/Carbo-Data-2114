class AddTitleToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :title, :string
  end
end

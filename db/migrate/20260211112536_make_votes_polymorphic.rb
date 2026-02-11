class MakeVotesPolymorphic < ActiveRecord::Migration[7.1]
  def up
    # Add polymorphic columns
    add_column :votes, :votable_type, :string
    add_column :votes, :votable_id, :bigint

    # Migrate existing data: all current votes are for posts
    execute "UPDATE votes SET votable_type = 'Post', votable_id = post_id"

    # Make columns non-nullable now that data is migrated
    change_column_null :votes, :votable_type, false
    change_column_null :votes, :votable_id, false

    # Remove old post-specific column and index
    remove_index :votes, [:user_id, :post_id]
    remove_foreign_key :votes, :posts
    remove_column :votes, :post_id

    # Add polymorphic indexes
    add_index :votes, [:votable_type, :votable_id]
    add_index :votes, [:user_id, :votable_type, :votable_id], unique: true, name: "index_votes_on_user_and_votable"
  end

  def down
    add_reference :votes, :post, foreign_key: true

    execute "UPDATE votes SET post_id = votable_id WHERE votable_type = 'Post'"

    remove_index :votes, [:votable_type, :votable_id]
    remove_index :votes, name: "index_votes_on_user_and_votable"
    remove_column :votes, :votable_type
    remove_column :votes, :votable_id

    add_index :votes, [:user_id, :post_id], unique: true
  end
end

class CreateChatItems < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_items do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end

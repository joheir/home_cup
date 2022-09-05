class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.timestamps
    end
  end
end

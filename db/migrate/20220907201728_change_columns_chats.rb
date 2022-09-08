class ChangeColumnsChats < ActiveRecord::Migration[7.0]
  def change
    rename_column :chats, :sender_id, :sender_chat_id
  end
end

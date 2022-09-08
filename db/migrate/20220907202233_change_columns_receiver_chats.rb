class ChangeColumnsReceiverChats < ActiveRecord::Migration[7.0]
  def change
    rename_column :chats, :receiver_id, :receiver_chat_id
  end
end

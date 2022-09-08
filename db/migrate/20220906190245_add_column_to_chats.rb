class AddColumnToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :done, :boolean, default: false
  end
end

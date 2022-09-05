class AddColumnToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :message, :string
  end
end

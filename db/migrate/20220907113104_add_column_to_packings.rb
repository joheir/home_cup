class AddColumnToPackings < ActiveRecord::Migration[7.0]
  def change
    add_column :packings, :checked, :boolean, default: false
  end
end

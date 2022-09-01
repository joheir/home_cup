class Profiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :progress, :decimal
  end
end

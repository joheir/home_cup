class DeleteProgress < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :progress
  end
end

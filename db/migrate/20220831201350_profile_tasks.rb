class ProfileTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_tasks, :start_time, :datetime
  end
end

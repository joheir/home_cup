class CreateProfileTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_tasks do |t|
      t.references :profile, null: false, foreign_key: true
      t.boolean :done, default: false
      t.references :task_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end

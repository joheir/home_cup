class CreateTaskTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :task_templates do |t|
      t.references :account, null: false, foreign_key: true
      t.string :weekday
      t.string :title
      t.string :description
      t.integer :min_age

      t.timestamps
    end
  end
end

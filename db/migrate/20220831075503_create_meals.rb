class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :url
      t.string :picture_url
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

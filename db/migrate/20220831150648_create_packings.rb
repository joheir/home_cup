class CreatePackings < ActiveRecord::Migration[7.0]
  def change
    create_table :packings do |t|
      t.string :name
      t.string :item1
      t.string :item2
      t.string :item3
      t.string :item4
      t.string :item5
      t.string :item6
      t.string :item7
      t.string :item8
      t.string :item9
      t.string :item10
      t.string :color
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

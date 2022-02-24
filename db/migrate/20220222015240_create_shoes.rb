class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.integer :manufacturer_id, null: false
      t.integer :color_id, null: false
      t.integer :inout_id, null: false
      t.string :title, null: false
      t.text :explanation, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :brand_id
      t.string :title
      t.integer :price
      t.string :style

      t.timestamps null: false
    end
  end
end

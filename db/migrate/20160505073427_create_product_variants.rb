class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :color_id

      t.timestamps null: false
    end
  end
end

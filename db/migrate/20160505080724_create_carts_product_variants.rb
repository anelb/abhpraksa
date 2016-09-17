class CreateCartsProductVariants < ActiveRecord::Migration
  def change
    create_table :carts_product_variants, id: false do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product_variant, index: true, foreign_key: true
    end
  end
end

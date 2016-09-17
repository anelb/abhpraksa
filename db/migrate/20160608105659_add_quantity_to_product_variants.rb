class AddQuantityToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :quantity, :integer
  end
end

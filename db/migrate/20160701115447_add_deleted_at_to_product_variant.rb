class AddDeletedAtToProductVariant < ActiveRecord::Migration
  def change
    add_column :product_variants, :deleted_at, :datetime
    add_index :product_variants, :deleted_at
  end
end

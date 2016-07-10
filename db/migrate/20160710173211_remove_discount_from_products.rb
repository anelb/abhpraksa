class RemoveDiscountFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :discount, :integer
  end
end

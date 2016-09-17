class AddFinishedToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :finished, :boolean, default: false
  end
end

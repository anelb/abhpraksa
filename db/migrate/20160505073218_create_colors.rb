class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :product_color

      t.timestamps null: false
    end
  end
end

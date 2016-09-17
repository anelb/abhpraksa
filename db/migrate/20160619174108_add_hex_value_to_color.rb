class AddHexValueToColor < ActiveRecord::Migration
  def change
    add_column :colors, :hex_value, :string
  end
end

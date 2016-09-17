class Color < ActiveRecord::Base
  has_many :product_variants

  def self.find_color_id(color_name)
    self.find_by(product_color: color_name).id
  end
end

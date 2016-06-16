class ProductVariant < ActiveRecord::Base

  belongs_to :product
  belongs_to :color
  belongs_to :size

  has_many :cart_items

  def self.check_quantity(product_variant) 
    self.where( size_id: product_variant.size_id, color_id: product_variant.color_id, product_id: product_variant.product )
  end

end

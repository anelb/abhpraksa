class CartItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product_variant

  validates :cart_id, :product_variant_id, :quantity, presence: true

  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1

  
  validate :quantity_check

  def quantity_check
    if !quantity.nil? && quantity.is_a?(Integer)
      if quantity > product_variant.quantity
        errors.add(:kolicina, "cant be higher than #{product_variant.quantity}")
      end
    end
  end

  def product_variant
    ProductVariant.unscoped { super }
  end

  def as_json
    {
      'cart_item_id': self.id,
      'cart_id': self.cart.id,
      'quantity': self.quantity,
      'title': self.product_variant.product.title,
      'brand': self.product_variant.product.brand.title,
      'size': self.product_variant.size.product_size,
      'color': self.product_variant.color.product_color,
      'price': self.product_variant.product.price,
      'image_url': self.product_variant.product.picture_link
    }
  end
end

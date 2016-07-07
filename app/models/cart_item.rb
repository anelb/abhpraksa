class CartItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product_variant

  validates :cart_id, :product_variant_id, :quantity, presence: true

  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1

  validate :quantity_check

  def quantity_check
    if quantity > product_variant.quantity
      errors.add(:kolicina, "has to be less then #{product_variant.quantity}") 
    end
  end

  def product_variant
    ProductVariant.unscoped { super }
  end
end

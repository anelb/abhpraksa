class CartItem < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product_variant

	validates :cart_id, :product_variant_id, :quantity, presence: true

  validate :quantity_check

  def quantity_check
    return if quantity.nil?
    product_variant_qunatity = ProductVariant.check_quantity(product_variant).count
    if quantity > product_variant_qunatity
        errors.add(:quantity, "has to be less then #{product_variant_qunatity}") 
    end
  end
end

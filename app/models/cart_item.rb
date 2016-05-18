class CartItem < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product_variant

	validates :cart_id, :product_variant_id, :quantity, presence: true

end

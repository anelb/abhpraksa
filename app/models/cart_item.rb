class CartItem < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product_variant

  #accepts_nested_attributes_for :product_variant

end

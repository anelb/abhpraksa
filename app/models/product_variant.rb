class ProductVariant < ActiveRecord::Base
	belongs_to :product
	belongs_to :color
	belongs_to :size
	has_and_belongs_to_many :carts
end

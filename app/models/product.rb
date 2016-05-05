class Product < ActiveRecord::Base
	has_many :product_variants
	belongs-to :brand
	belongs_to :category
end

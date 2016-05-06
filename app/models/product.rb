class Product < ActiveRecord::Base
  has_many :product_variants
  belongs_to :brand
  belongs_to :category
  has_and_belongs_to_many :categories
end

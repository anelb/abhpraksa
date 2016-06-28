class ProductVariant < ActiveRecord::Base

  belongs_to :product, :validate => true
  belongs_to :color
  belongs_to :size

  has_many :cart_items

  #validates :color_id, uniqueness: { scope: [ :product_id, :size_id ] }
  #validates_associated :product
end

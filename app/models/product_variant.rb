class ProductVariant < ActiveRecord::Base

  belongs_to :product
  belongs_to :color
  belongs_to :size

  has_many :cart_items

end

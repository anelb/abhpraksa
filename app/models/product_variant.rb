class ProductVariant < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :product, :validate => true
  belongs_to :color
  belongs_to :size

  has_many :cart_items
  
  validates :quantity, presence: true
  #validates :color_id, uniqueness: { scope: [ :product_id, :size_id ] }
  #validates_associated :product

  def product_variant_size
    Size.find(self.size_id).product_size
  end

  def product_variant_color
    Color.find(self.color_id).product_color
  end

  def product_title
    Product.find(self.product_id).title
  end

  def product_price
    Product.find(self.product_id).price
  end

  
end

class Product < ActiveRecord::Base

  has_many :product_variants, dependent: :destroy 
  has_many :sizes, through: :product_variants
  has_many :colors, through: :product_variants
  belongs_to :brand
  has_and_belongs_to_many :categories

  validates :brand_id, :title, :price, :description, presence: true
  validate :category_blank?
  
  accepts_nested_attributes_for :product_variants

  def category_blank?
    if self.categories.blank?
      errors.add(:category, 'field cant be empty')
    end
  end

  def self.remove_empty_product_variants
    self.all.map do |product|
      product.product_variants.blank? ? self.find(product.id).destroy : product
    end
  end
  def capitalize_category
    categories.first.title.mb_chars.downcase.split.collect { |category| category.capitalize.to_s }.join(' ')
  end
end

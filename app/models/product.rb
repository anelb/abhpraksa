class Product < ActiveRecord::Base

  has_many :product_variants, dependent: :destroy 
  has_many :sizes, through: :product_variants
  has_many :colors, through: :product_variants
  belongs_to :brand
  has_and_belongs_to_many :categories

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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

  def create_with_product_variants(quantity)
    self.save
    quantity.to_i.times { ProductVariant.find_by(product_id: self.id).dup.save }
  end

  def create_with_category(params)
    params[:category_id].map do |id|
      self.categories.push(Category.find(id))
    end
  end
end

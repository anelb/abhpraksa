class Product < ActiveRecord::Base

  has_many :product_variants, dependent: :destroy 
  has_many :sizes, through: :product_variants
  has_many :colors, through: :product_variants
  belongs_to :brand
  has_and_belongs_to_many :categories

 
  accepts_nested_attributes_for :product_variants, :allow_destroy => true, :reject_if => :all_blank

  has_attached_file :image, styles: {
    thumb: '100x200>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates :title, uniqueness: true
  validates :brand_id, :title, :price, :description, presence: true
  validate :category_blank
  validate :duplicate_variant
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 1.megabytes

  scope :products_with_discount, -> { where('discount > ?', 0) }
  scope :products_without_discount, -> { where(discount: 0) }
  #validates_associated :product_variants, :message => "Already Taken"
  
  def duplicate_variant
    without_quantity = self.product_variants.map do |k| 
      k.attributes.except!('quantity', 
                           'id',
                           'created_at',
                           'updated_at') 
    end
    if without_quantity.length > without_quantity.uniq.length 
      errors.add(:product_variant, 'error: There is at least two variants with same attributes')
    end
  end

  def category_blank
    #byebug
    if self.categories.blank?
      errors.add(:category, 'field cant be empty')
    end
  end

  def capitalize_category
    categories.first.title.mb_chars.downcase.split.collect { |category| category.capitalize.to_s }.join(' ')
  end

  def build_with_category(params)
    return unless params[:category_id].present?
    params[:category_id].map do |id|
      self.categories.push(Category.find(id))
    end 
  end

  def picture_link
    if self.image.url.include? 'missing'
      self.photo_url
    else
      self.image.url
    end
  end

  def price
    with_discount || super
  end

  def with_discount
    self[:discount] > 0 ? self[:price] - (self[:price] * (self[:discount]/100)) : nil
  end

  def has_discount?
    self.discount > 0
  end
  
end

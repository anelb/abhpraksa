class Product < ActiveRecord::Base

  before_save :round_price

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
  

  def round_price
    self.price.round(1)  
  end

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
    #byebug
    if self.image.url.include?('missing') && self.photo_url.blank?
      'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/300px-No_image_available.svg.png'
    elsif self.image.url.include? 'missing'
      self.photo_url
    else
      self.image_url
    end
  end

  # def price
  #   with_discount || super
  # end

  def with_discount
    (self.price - (self.price * (self.discount/100))).round(2)  if self.discount > 0 
  end

  def has_discount?
    self.discount > 0
  end

  def with_proper_picture
    {
      'id': self.id,
      'photo_url': picture_link
    }   
  end

  def custom_json
   
    response = { 
      'id': self.id,
      'title': self.title, 
      'description': self.description.gsub("\n",''),
        
      'price': nil,
      
      'photo_url': self.picture_link,
      'variants': 
    
     
        self.product_variants.map do |x| 
        { 'size': x.size.product_size,
          'color': Color.find(x.color_id).hex_value, 
          'quantity': x.quantity  
        }
        end
      
    }
    #byebug
    if self.has_discount?
      response[:price] = self.with_discount.to_f
      response[:discount_value] = self.discount.to_f
    else
      response[:price] = self.price.to_f
    end
    response
  end

end

# def custom_json
#   { 'title': self.title, 
#     'description': self.description.gsub("\n",''),
#     'price': self.price,
#   'variants': 
#   Size.all.map do |size|
#     product_variant = self.product_variants.where(product_id: self.id, size_id: size.id)
#     if !product_variant.blank?
#       { 'size': size.product_size,
#         'colors':
#         product_variant.map do |x| 
#           { 'color': Color.find(x.color_id).hex_value, 'quantity': x.quantity }
#         end
#       }
#     end
#   end.compact
#   }
# end

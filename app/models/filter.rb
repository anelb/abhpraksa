class Filter
  def initialize(params)
    @brand = params[:brand]
    @color = params[:color]
    @size = params[:size]
    @category = params[:id]
  end
  def build
    conditions = {}
    conditions['products.brand_id'] = @brand if @brand.present?
    conditions['product_variants.color_id'] = @color if @color.present?
    conditions['product_variants.size_id'] = @size if @size.present?
    #conditions['products.categories'] = @category
    Product.joins(:product_variants).where(conditions).group('products.id')
    #Product.joins(:product_variants)
    #.where('product_variants.color_id = ? AND product_variants.size_id = ? AND products.brand_id = ?', 7, 1, 1)
    #.group('products.id')
  end
end
class Api::V1::ProductVariantsController < ApiController

  before_action :set_product

  def index
    @product_variants = @product.product_variants
    render response: @product_variants
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
  

end
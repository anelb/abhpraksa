class Api::ProductVariantsController < AdminController

  before_action :set_product

  def index
    @product_variants = @product.product_variants
    render json: @product_variants, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
  

end
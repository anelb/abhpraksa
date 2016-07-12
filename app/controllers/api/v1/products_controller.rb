class Api::V1::ProductsController < ApiController

  before_action :set_category, only: [:index, :show]

  def index
    if params[:page]
      @products = @category.products.select(:id, :photo_url).paginate(:page => params[:page], :per_page => 20)
    else
      @products = @category.products.select(:id, :photo_url)
    end
    render response: @products
  end


  def show_product
    @product = Product.find(params[:product_id])
    render response: @product.custom_json
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

end
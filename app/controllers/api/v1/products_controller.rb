class Api::V1::ProductsController < ApiController

  before_action :set_category, only: [:index, :show]

  def index
    @products = @category.products.paginate(page: params[:page], per_page: 5)
    render response: @products
  end

  def show
    @product = Product.find(params[:id])  
    render response: @product
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

end
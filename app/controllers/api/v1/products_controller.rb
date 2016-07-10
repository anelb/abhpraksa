class Api::V1::ProductsController < ApiController

  before_action :set_category, only: [:index, :show]

  def index
    @products = @category.products.paginate(page: params[:page], per_page: 5)
    render json: @products, status: :ok
  end

  def show
    @product = Product.find(params[:id])  
    render json: @product
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

end
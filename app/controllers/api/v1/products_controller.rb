class Api::V1::ProductsController < ApiController

  before_action :set_category, only: [:index, :show]
  before_action :set_product, only: [:show ]

  def index
    pictures = @category.products.select(:id, :photo_url)
    @products = pictures.paginate(:page => params[:page], :per_page => 20)
    render response: @products
  end

  def show
    render response: @product
  end

  private

  def set_product
    @product = Product.find(params[:id])  
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
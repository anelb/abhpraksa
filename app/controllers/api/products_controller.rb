class Api::ProductsController < AdminController

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def show
    @product = Product.find(params[:id])

    render json: @product
    #byebug
  end


end
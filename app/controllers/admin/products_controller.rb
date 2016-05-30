class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
  	@product = Product.new
    @product_variants = @product.product_variants.build
  end

  def create
    @product = Product.new(product_params)
    byebug
  end


  private
    def product_params
      params.require(:product).permit(:title, :price, :description)
                    #:product_variants_attributes => [:size_id, :color_id ])
    end


end

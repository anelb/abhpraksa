class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
  	@product = Product.new
    @product.product_variants.build
  end

  def create
    @brand = Brand.find(params[:brand][:id])
    @category = Category.find(params[:category][:id])
    @product = @brand.products.build(product_params)
    @product.categories.push(@category)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end


  private
    def product_params
      params.require(:product).permit(:title, :price, :description,
                    :product_variants_attributes => [ :color_id, :size_id ])
    end


end

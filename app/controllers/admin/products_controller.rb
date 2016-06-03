class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
  	@product = Product.new
    @product.build_brand
  end

  def show
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      flash[:info] = 'New product created'
      redirect_to admin_products_path
    else
      render 'new'
    end
  end


  private

    def product_params
      params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url,
                                      brand_attributes: [:id] )
    end

end

# begin
#   @brand = Brand.find(params[:brand][:id])
#   @category = Category.find(params[:category][:id])
#   @product = @brand.products.build(product_params)
#   @product.categories.push(@category)
#   @product.save!
#   redirect_to admin_products_path
# rescue ActiveRecord::RecordNotFound => e
#   flash[:warning] = e.message
#   redirect_to new_admin_product_path
# end

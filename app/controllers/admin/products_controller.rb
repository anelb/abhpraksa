class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
  	@product = Product.new
  end

  def show
    
  end

  def create
    @product = Product.new(product_params)
    begin
      params[:category_id].each do |id|
        @product.categories.push(Category.find(id))
      end
      @product.save!
      redirect_to admin_products_path
    rescue Exception => e
      @product.save
      flash[:info] = e
      render 'new'
    end
  end


  private

    def product_params
      params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url)
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

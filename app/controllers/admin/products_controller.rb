class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
  	@product = Product.new
    @product.product_variants.build
  end

  def edit
    @product = Product.find(params[:id])    
    #byebug
  end

  def create
    @product = Product.new(product_params)
    begin
      @product.create_with_category(params)
      @product.create_with_product_variants(params[:quantity])
      flash[:info] = 'New product created'
      redirect_to admin_products_path
    rescue
      @product.save
      render 'new'
    end
  end


  private

    def product_params
      params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url,
                                      product_variants_attributes: [ :id, :size_id, :color_id ])
    end

end

class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if params[:product][:photo_url].present?
      file = File.open(open(params[:product][:photo_url]).path)
      params[:product][:image] = file
    end
    @product = Product.new(product_params)
    #@product = Product.build_new_product(params)
    @product.build_with_category(params)
    #byebug
    # if params[:product][:product_variants_attributes]
    #   @product.build_with_variant(params)
    # end
    if @product.save
      flash[:info] = 'New product created'
      redirect_to admin_products_path
    else
      render 'new'
      #byebug
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.build_with_category(params)
    if @product.update(product_params)
      flash[:info] = 'Product updated'
      redirect_to admin_products_path
    else
      render 'edit'
    end
    #byebug
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:info] = 'Product deleted'
    redirect_to admin_products_path
  end


  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url, :image, :discount,
                                    product_variants_attributes: [ :id, :size_id, :color_id, :quantity, :_destroy ])
  end

end

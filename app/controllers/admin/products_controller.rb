class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    product_variants = params[:product][:product_variants_attributes].map{ |k, v| [v[:size_id], v[:color_id]]  }
    @product.build_with_category(params)
    if same_variant(product_variants)
      @product.errors.add(:duplicate_variants, ": There is at least two variants with same attributes")
      render 'new'
    elsif @product.save
      flash[:info] = 'New product created'
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product_variants = params[:product][:product_variants_attributes].map{ |k, v| [v[:size_id], v[:color_id]]  }
    @product.build_with_category(params)
    if same_variant(product_variants)
      @product.errors.add(:duplicate_variants, ": There is at least two variants with same attributes")
      render 'edit'
    elsif @product.update(product_params)
      flash[:info] = 'Product updated'
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:info] = 'Product deleted'
    redirect_to admin_products_path
  end


  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url, :image,
                                    product_variants_attributes: [ :id, :size_id, :color_id, :quantity, :_destroy ])
  end

  def same_variant(variants)
    (1..(variants.length)).collect {|v| variants[0] == variants[v] }.include? true
  end

end

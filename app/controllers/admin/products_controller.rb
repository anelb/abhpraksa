class Admin::ProductsController < AdminController

  before_action :set_product_variants_params, only: [ :create, :update ]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.build_with_category(params)
    if @product.save && !same_variant(@product_variants)
      flash[:info] = 'New product created'
      redirect_to admin_products_path
    else
      if same_variant(@product_variants)
        @product.errors.add(:duplicate_variants, ": There is at least two variants with same attributes")                
      end
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.build_with_category(params)
    if same_variant(@product_variants)
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

  def set_product_variants_params
    product_variants_params = params[:product][:product_variants_attributes]
    @product_variants = product_variants_params.blank? ? [] : product_variants_params.map { |_k, v| [v[:size_id], v[:color_id]] }
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :brand_id, :photo_url, :image,
                                    product_variants_attributes: [ :id, :size_id, :color_id, :quantity, :_destroy ])
  end

  def same_variant(variants)
    (1..(variants.length)).collect { |v| variants[0] == variants[v] }.include? true
  end

end

class Api::V1::ProductsController < ApiController

  before_action :set_category, only: [:index, :show]

  def index
    params[:per_page] ||= 20
    if params[:page] || params[:per_page]
      @products = @category.products.select(:id, :photo_url).paginate(:page => params[:page], :per_page => params[:per_page])
    else
      @products = @category.products.select(:id, :photo_url)
    end
    render response: @products
  
  end


  def show_product
    
    @product = Product.find(params[:product_id])
    render response: @product.custom_json
  rescue ActiveRecord::RecordNotFound
    raise Api::Exceptions::RecordNotFound, 'Product'
    
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

end
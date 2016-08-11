class Api::V1::ProductVariantsController < ApiController

  before_action :set_product

  def index
    @product_variants = @product.product_variants
    render response: @product_variants
    #byebug
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
  
end




#{ 'variants': @product_variants.as_json.map { |x| { 'size': Size.find(x['size_id']).product_size } } }
#{:variants=>[{:size=>35}, {:size=>35}, 
#{:size=>36}, {:size=>36}, {:size=>36}, {:size=>37}, {:size=>37}, {:size=>38}, {:size=>38}]}

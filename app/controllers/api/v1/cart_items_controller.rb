class Api::V1::CartItemsController < ApiController

  def index
    current_cart = Cart.find(3)
    @cart_items = current_cart.cart_items
    render response: @cart_items
  end

  def create
    
    @product = params[:product_id]
    current_cart = Cart.find(params[:cart_id])
    begin
    @product_variant = ProductVariant.find_by(size_id:  params[:size_id], 
                                              color_id: Color.find_color_id(params[:color_id]),
                                              product_id: @product)
    
    @cart_item = current_cart.new_item(product_variant: @product_variant, 
                                       params: {'cart_id': params[:cart_id], 'quantity': params[:quantity] })
    
    rescue Exception => e 
      puts e
    end
    if @cart_item.save
      render response: @cart_item
    else
      raise Api::Exceptions::ValidationException.new(@cart_item.errors.full_messages)
    end
  end

  private

end
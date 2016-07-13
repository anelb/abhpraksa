class Api::V1::CartsController < ApiController

  def index
    current_cart = Cart.find(params[:cart_id])
    @cart_items = current_cart.cart_items
    render response: @cart_items
  end

  def add
   
    @product = params[:product_id]
    if params[:cart_id]
      current_cart = Cart.find(params[:cart_id])
    else
      current_cart = Cart.create
    end
    begin

    @product_variant = ProductVariant.find_by(size_id:  params[:size_id], 
                                              color_id: Color.find(params[:color_id]),
                                              product_id: @product)
    
    @cart_item = current_cart.new_item(product_variant: @product_variant, 
                                       params: {'cart_id': current_cart.id, 'quantity': params[:quantity] })
     byebug
    rescue Exception => e 
      puts e
    end
    if @cart_item.save
      render response: @cart_item
    else
      raise Api::Exceptions::ValidationException.new(@cart_item.errors.full_messages)
    end
  end

  def destroy
    
  end

  def count
    
  end


end
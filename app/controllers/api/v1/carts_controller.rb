class Api::V1::CartsController < ApiController

  def index
    if params[:api_token]
      user = User.find_by(api_token: params[:api_token])
      current_cart = user.cart
      @cart_items = current_cart.cart_items
      render response: @cart_items.as_json
    else
      current_cart = Cart.find(params[:cart_id])
      @cart_items = current_cart.cart_items
      render response: @cart_items.as_json
    end
  end

  def add
    @product = params[:product_id]
    begin
    if params[:api_token]
      user = User.find_by(api_token: params[:api_token])
      if user.cart
        current_cart = user.cart
      else
        current_cart = user.create_cart
      end
    elsif params[:cart_id]
      current_cart = Cart.find(params[:cart_id])
    else
      current_cart = Cart.create
    end
    rescue Exceptions => e
      puts e
    end
    @product_variant = ProductVariant.find_by(size_id:  params[:size_id], 
                                              color_id: Color.find_by(hex_value: params[:color_id]),
                                              product_id: @product)
    
    @cart_item = current_cart.new_item(product_variant: @product_variant, 
                                       params: {'cart_id': current_cart.id, 'quantity': params[:quantity] })
   
    if @cart_item.save
      render response: @cart_item.as_json
    else
      raise Api::Exceptions::ValidationException.new(@cart_item.errors.full_messages)
    end
  end

  def destroy
    if params[:api_token]
      user = User.find_by(:api_token)
      cart = user.cart
      cart.cart_items.find(params[:cart_item_id]).destroy
      render response: Api::Response
    else
      cart = Cart.find(params[:cart_id])
      cart.cart_items.find(params[:cart_item_id]).destroy
      render response: Api::Response
    end
  end

  def count
    if params[:api_token]
      user = User.find_by(:api_token)
      cart = user.cart
      render response: { 'count': cart.cart_items.map { |x| x.quantity}.inject(0, :+) }
    else
      cart = Cart.find(params[:cart_id])
      render response: { 'count': cart.cart_items.map { |x| x.quantity}.inject(0, :+) }
    end
  end


end
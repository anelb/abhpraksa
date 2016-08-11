module CartsHelper


  def current_cart
    if current_user
      #byebug
      if !current_user.has_cart?
        create_cart
      elsif current_user.has_unfinished_cart?
        current_user.unfinished_cart
      elsif cart_present?
        if @current_cart.no_user?
          @current_cart.add_user_id(current_user)
        else
          create_cart
        end
      end
    else
      if cart_present?
        @current_cart
      else
        create_cart
      end
    end
  end

 
  def create_cart
    if current_user
      @current_cart = current_user.create_cart
      session[:cart_id] = @current_cart.id
    else
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
    return @current_cart
  end

  def cart_present?
    @current_cart = Cart.find_by(id: session[:cart_id])
    return @current_cart if @current_cart.present?
  end

  def has_deleted_product_variant?(cart)
    return cart.map { |item| item.product_variant.deleted? }.include? true
  end
  
end

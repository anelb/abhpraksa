module CartsHelper

  def current_cart
    if session[:cart_id]
      begin
        @current_cart ||= Cart.find(session[:cart_id])
        if current_user
          @current_cart.add_user_id(current_user)
        end
      rescue ActiveRecord::RecordNotFound => e
        create_cart
      end
    else
      create_cart
    end
    @current_cart
  end

  def create_cart
    @current_cart = Cart.create!
    session[:cart_id] = @current_cart.id
  end

  def has_deleted_product_variant?(cart)
    return cart.map { |item| item.product_variant.deleted? }.include? true
  end
  
end

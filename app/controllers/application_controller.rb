class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user 
  helper_method :current_cart

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def current_cart
    if session[:cart_id].nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
      @current_cart 
    elsif current_user
      @current_cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @current_cart.id
      @current_cart 
    else
      @current_cart = Cart.find(session[:cart_id])
      session[:cart_id] = @current_cart.id
      @current_cart 
    end
  end

end

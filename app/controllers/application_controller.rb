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
    if session[:cart_id]
      begin
        @current_cart ||= Cart.find(session[:cart_id])
        #byebug
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

end


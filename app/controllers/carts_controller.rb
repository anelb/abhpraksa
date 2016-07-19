class CartsController < ApplicationController

  before_action :cart_exist?
  
  def show
    @cart = current_cart.cart_items
    @order = Order.new
  end

  def destroy
    Cart.find(params[:cart_id]).destroy
    flash[:success] = 'Your cart is now empty'
    redirect_to root_path
  end

  private

  def cart_exist?
    redirect_to root_path if current_cart.cart_items.blank? || order_already_completed?
  end

  def order_already_completed?
    if !current_cart.order.nil?
      session[:cart_id] = nil
      true
    end
  end
end

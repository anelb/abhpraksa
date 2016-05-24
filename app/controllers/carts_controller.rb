class CartsController < ApplicationController
  def show
    @order = Order.new
    @cart = current_cart.cart_items
  end

  def destroy
  	Cart.find(params[:cart_id]).destroy
  	flash[:success] = 'Your cart is now empty'
  	redirect_to root_path
  end
end

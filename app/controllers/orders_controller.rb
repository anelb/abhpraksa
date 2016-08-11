class OrdersController < ApplicationController


  def index
    @carts = Cart.where(user_id: current_user.id)
    #byebug
  end

  def show
    
  end

  def create

    
    @order = current_cart.build_order(order_params)
    
    customer = Stripe::Customer.create(
      :email           => params[:stripeEmail],
      :source          => params[:stripeToken]
    )
    
    begin
      #byebug
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => params[:amount].to_i,
        :description => 'AbhShop Customer',
        :currency    => 'usd'
      )
      
      @order.save
      current_cart.remove_product_variant
      current_cart.update_attribute(:finished, true)
      session[:cart_id] = nil
      flash[:success] = 'Thanks for ordering!'
      UserMailer.order_completed(current_user).deliver_now
      redirect_to root_path
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  end

  private

  def order_params
    params.permit(:stripeShippingAddressLine1,
                  :stripeShippingAddressZip,
                  :stripeShippingAddressCity,
                  :stripeShippingAddressCountry,
                  :stripeShippingAddressCountryCode )
  end

end

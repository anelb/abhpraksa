class OrdersController < ApplicationController

  before_action :user_has_to_be_logged_in, only: [ :create ]

  def new
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

  def user_has_to_be_logged_in
    unless current_user
      redirect_to sign_in_path
    end
  end

  def order_params
    params.permit(:stripeShippingAddressLine1,
                  :stripeShippingAddressZip,
                  :stripeShippingAddressCity,
                  :stripeShippingAddressCountry,
                  :stripeShippingAddressCountryCode )
  end
end

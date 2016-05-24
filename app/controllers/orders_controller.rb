class OrdersController < ApplicationController

  def new
  end

  def create

    @amount = current_cart.total + current_cart.delivery_cost

    Stripe.api_key = 'sk_test_16AbhCb7Wn82EeAkxBYXBF5l'

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end

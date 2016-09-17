class Api::V1::OrdersController < ApiController

  before_action :restrict_api_access

  def create
    
    cart = Cart.find(params[:cart_id])
    @order = cart.build_order(stripeShippingAddressLine1: params[:stripeShippingAddressLine1],
                              stripeShippingAddressZip: params[:stripeShippingAddressZip],
                              stripeShippingAddressCity: params[:stripeShippingAddressCity],
                              stripeShippingAddressCountry: params[:stripeShippingAddressCountry],
                              stripeShippingAddressCountryCode: params[:stripeShippingAddressCountryCode])
    #byebug
    customer = Stripe::Customer.create(
      :email           => params[:stripeEmail],
      :source          => params[:stripeToken]
    )
    
    begin
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => 10,
        #:amount      => params[:amount].to_i,
        :description => 'AbhShop',
        :currency    => 'usd'
      )
      @order.save
      
      cart.remove_product_variant
      UserMailer.order_completed(current_user).deliver_now
      render response: @order
    rescue Stripe::CardError => e
      render response: e
    end
  end

  private

  def order_params
    params.permit(:api_token, 
                  :stripeEmail, 
                  :stripeToken, 
                  :format, 
                  :cart_id,
                  :stripeShippingAddressLine1,
                  :stripeShippingAddressZip,
                  :stripeShippingAddressCity,
                  :stripeShippingAddressCountry,
                  :stripeShippingAddressCountryCode )
  end
end
module Api::V1::CartsHelper
  def custom_cart_response(current_cart)
    @cart_items = current_cart.cart_items
    render response: @cart_items.as_json
  end
end
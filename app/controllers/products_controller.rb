class ProductsController < ApplicationController

  before_action :set_product

  def show
    @product_variant = ProductVariant.find_by(product_id: @product.id)
    @cart_item = @product_variant.cart_items.build(cart_id: current_cart)
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

end

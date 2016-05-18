class ProductsController < ApplicationController

  before_action :set_product

  def show
    product_variant = ProductVariant.where(product_id: @product)
    @size = product_variant.map { |x| x.size }
    @color = product_variant.map { |x| x.color }
    @cart_item = CartItem.new()
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

end

# def show
#   @product_variant = ProductVariant.find( @product.id )
#   @cart_item = @product_variant.cart_items.build
# end

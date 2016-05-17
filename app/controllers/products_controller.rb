class ProductsController < ApplicationController

  before_action :set_product

  def show
  	@product_variant = ProductVariant.find( @product.id )
    @cart_item = @product_variant.cart_items.build
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

end

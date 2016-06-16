class ProductsController < ApplicationController

  before_action :set_product

  def show
    product_variant = ProductVariant.where(product_id: @product)
    @size = product_variant.map { |product| product.size }
    @color = product_variant.map { |product| product.color }
    @cart_item = CartItem.new()
    @grouped_options = [
     ['35',
       ['Yellow','Red']],
     ['36',
       ['Green','Black','Grey']]
    ]
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
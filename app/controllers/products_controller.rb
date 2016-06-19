class ProductsController < ApplicationController

  before_action :set_product

  def show
    product_variant = ProductVariant.where(product_id: @product)
    @size = product_variant.map { |product| product.size }.uniq
    @color = product_variant.map { |product| product.color }
    @cart_item = CartItem.new()
    @test_color = Hash.new {|k, v| k[v]= []}
    product_variant.each { |product| @test_color[Size.find(product.size_id).product_size] <<
                                                    Color.find(product.color_id).product_color.strip }
    #byebug                                                
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
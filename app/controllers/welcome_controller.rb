class WelcomeController < ApplicationController

  def index
    @products = Product.products_without_discount
    @sale_products = Product.products_with_discount
  end

end

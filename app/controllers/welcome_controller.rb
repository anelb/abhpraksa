class WelcomeController < ApplicationController

  def index
    @products = Product.all
    @sale_products = Product.all
  end

end

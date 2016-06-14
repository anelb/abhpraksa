class WelcomeController < ApplicationController

  def index
    @products = Product.all.shuffle
    @sale_products = Product.all.shuffle
  end

end

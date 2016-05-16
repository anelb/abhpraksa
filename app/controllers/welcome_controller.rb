class WelcomeController < ApplicationController

  #before_action set_category

  def index
    @products = Product.all
  end

  def set_category
    @category = Category.find()
  end
end

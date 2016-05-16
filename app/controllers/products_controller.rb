class ProductsController < ApplicationController

  layout "application"
  
  def show
    @product = Product.find(params[:id])
  end
end

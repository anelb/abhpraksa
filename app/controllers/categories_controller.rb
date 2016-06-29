class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Filter.new(params).build
    #params[:brand] ? @products = Product.by_brand(params[:brand]).to_a : @products = @category.products
    #byebug
  end
end

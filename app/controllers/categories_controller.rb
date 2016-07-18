class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if params.length == 3
      @products = @category.products.uniq
    else
      @products = Filter.new(params).build
    end
    #byebug
    #params[:brand] ? @products = Product.by_brand(params[:brand]).to_a : @products = @category.products
  end
end

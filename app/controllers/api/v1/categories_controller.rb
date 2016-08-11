class Api::V1::CategoriesController < ApiController

  def index
    @categories = Category.all
    render response: @categories
  end

  def show
    
    @category = Category.find(params[:id])
    render response: @category
  rescue ActiveRecord::RecordNotFound
    raise Api::Exceptions::RecordNotFound, 'Category'
    
  end

end
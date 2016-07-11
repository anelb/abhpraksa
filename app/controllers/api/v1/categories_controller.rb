class Api::V1::CategoriesController < ApiController

  def index
    @categories = Category.all
    render response: @categories
  end

  def show
    begin
      @category = Category.find(params[:id])
      render response: @category
    rescue ActiveRecord::RecordNotFound
      raise Api::Exceptions::RecordNotFound.new('Category')
    end
  end

end
class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:info] = 'New category created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:info] = 'Category updated'
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:info] = 'Category deleted'
    redirect_to admin_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:title)
  end
end

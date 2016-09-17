class Admin::DashboardController < AdminController

  def index
    @categories = Category.all
    @product_variants = ProductVariant.all
    @users = User.all
  end
end

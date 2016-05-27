class Admin::DashboardController < AdminController

  def show
    @categories = Category.all
    @product_variants = ProductVariant.all
    @users = User.all
  end
end

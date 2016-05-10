class Admin::UsersController < AdminController

  def index
    @users = User.find_without_ordering
  end
  
  def promote
    @user = User.find(params[:user_id])
    @user.update_attribute(:role, 'admin')
    redirect_to admin_users_path
  end

  def demote
    @user = User.find(params[:user_id])
    @user.update_attribute(:role, 'basic')
    redirect_to admin_users_path
  end
end

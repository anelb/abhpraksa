class Admin::UsersController < AdminController

  def index
    @users = User.order(:id)
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = 'New user created'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:info] = 'User updated'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = 'User deleted'
    redirect_to admin_users_path
  end
  
  def promote
    @user = User.find(params[:user_id])
    @user.update_attribute(:role, 'admin')
    flash[:info] = 'User promoted to Admin'
    redirect_to admin_users_path
  end

  def demote
    @user = User.find(params[:user_id])
    @user.update_attribute(:role, 'basic')
    flash[:success] = 'User demoted to regular user'
    redirect_to admin_users_path
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end

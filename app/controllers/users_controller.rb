class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      #log_in @user
      #flash[:success] = "Registration successful, Welcome #{@user.first_name}" 
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
end

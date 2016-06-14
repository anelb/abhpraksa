class PasswordResetsController < ApplicationController


  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = 'Email sent with password rest instruction'
      redirect_to root_url 
    else
      flash.now[:danger] = 'Email address not fount'
      render 'new'
    end
  end
  def edit
    @user = User.find_by(email: params[:email])
  end

  def update
    @user = User.find_by(email: params[:email])
    if params[:user][:password].blank?
      flash.now[:info] = 'Password cant be blank'
      redirect_to edit_password_reset_url(params[:id], email: params[:email])
    elsif @user.update_attributes(user_params)
      flash[:success] = 'Password has been reset'
      UserMailer.password_changed(@user).deliver_now
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end

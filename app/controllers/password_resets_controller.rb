class PasswordResetsController < ApplicationController

  before_action :set_user, only: [ :edit, :update ]
  before_action :reset_token_valid, only: [ :edit ]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = 'Email sent with password reset instruction'
      redirect_to root_url 
    else
      flash.now[:warning] = 'Email address not found'
      render 'new'
    end
  end
  
  def edit
    @user = User.find_by(reset_digest: params[:id])
  end

  def update
    @user = User.find_by(reset_digest: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Password has been reset'
      UserMailer.password_changed(@user).deliver_now
      @user.delete_reset_digest
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(reset_digest: params[:id])
  end

  def reset_token_valid
    if @user.nil?
      flash[:info] = 'Link is not valid anymore. Please enter your email address to get new recovery link'
      redirect_to new_password_reset_path
    end
  end
end

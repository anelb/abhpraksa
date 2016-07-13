class Api::V1::UsersController < ApiController

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      render response: @user
    else
      raise Api::Exceptions::ValidationException, @user.errors.full_messages
    end
  end
  
  private

  def user_params
    params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
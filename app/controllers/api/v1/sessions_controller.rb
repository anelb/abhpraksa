class Api::V1::SessionsController < ApiController


  def create
    
    @user = User.find_by(email: params[:email])
    if !@user.blank?
      if @user.activated?
        
        if @user && @user.authenticate(params[:password])
          @user.update_attributes(api_token: SecureRandom.hex) unless @user.api_token
          if session[:cart_id].present?
            #byebug
            Cart.find(session[:cart_id]).update_attribute(:user_id, @user.id)
          end
        
          render response: { api_token: @user.api_token, username: @user.username }
        else
          raise Api::Exceptions::WrongLoginCredentials
        end
      else
        raise Api::Exceptions::UserNotActivated
      end
    else
      raise Api::Exceptions::NoEmailField
    end
  end

  def destroy
    User.find_by(params[:api_token]).destroy
  end


end
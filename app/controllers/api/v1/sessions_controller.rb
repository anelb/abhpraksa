class Api::V1::SessionsController < ApiController


  def create
    
    @user = User.find_by(email: params[:email])
    if !@user.blank?
      if @user.activated?
        
        if @user && @user.authenticate(params[:password])
          @user.update_attribute(:api_token, SecureRandom.hex) if !@user.api_token
          #byebug
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
    #byebug
    User.find_by(api_token: params[:api_token]).update_attribute(:api_token, nil)
    render response: Api::Response
  end


end
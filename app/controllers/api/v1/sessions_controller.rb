class Api::V1::SessionsController < ApiController


  def create
    
    @user = User.find_by(email: params[:email])
    if !@user.blank?
      if @user.activated?
        if @user && @user.authenticate(params[:password])
           @user.update_attributes(api_token: SecureRandom.hex) if !@user.api_token
           render response: { api_token: @user.api_token}
        else
          raise Api::Exceptions::WrongLoginCredentials
        end
      else
        rails Api::Exceptions::UserNotActivated
      end
    else
      raise Api::Exceptions::NoEmailField
    end
  end

  def destroy
    
  end


end
class SessionsController < ApplicationController

  def new  
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if !@user.blank?
      if @user.activated?
        if @user && @user.authenticate(params[:session][:password])
          log_in @user
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_to '/'
        else
          flash.now[:warning] = 'Invalid email/password combination'
          render 'new'
        end
      else
        flash[:warning] = 'Account is not activated. Check your email for the activation link.'
        redirect_to root_url
      end
    else
      flash[:warning] = "Email address doesn't exist"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

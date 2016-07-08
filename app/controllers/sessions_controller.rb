class SessionsController < ApplicationController

  def new  
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if attempt.to_i == 3
      if time_attempt > 20.seconds.ago
        time_to_wait = Time.now.round - time_attempt.round
        flash[:warning] = "You have to wait #{20 - time_to_wait} seconds before try to log in again"
      else
        cookies[:attempt] = nil
        flash[:info] = 'You can try to log in again'
      end
      redirect_to sign_in_path
    else
      if @user.activated?
        if @user && @user.authenticate(params[:session][:password])
          log_in @user
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_to '/'
        else
          flash.now[:warning] = 'Invalid email/password combination'
          increment_attempt_num
          render 'new'
        end
      else
        flash[:warning] = 'Account is not activated. Check your email for the activation link.'
        redirect_to root_url
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

class SessionsController < ApplicationController

  def new  
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if attempt.to_i == 3
      if time_attempt > 20.seconds.ago
        flash[:warning] = 'Too many wrong attempts'
      else
        cookies[:attempt] = nil
      end
      redirect_to sign_in_path
    else
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_to '/'
      else
        flash.now[:warning] = 'Invalid email/password combination'
        increment_attempt_num
        render 'new'
      end
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

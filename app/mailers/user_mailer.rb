class UserMailer < ApplicationMailer
  
  def welcome_email(user)
    @user = user
    mail to: @user.email, subject: "Welcome, #{@user.first_name}"
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: 'Password reset'
  end

  def password_changed(user)
    @user = user
    mail to: @user.email, subject: 'Password changed'
  end
end

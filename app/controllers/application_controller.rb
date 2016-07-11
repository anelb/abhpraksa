class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  #protect_from_forgery with: :null_session 

  include SessionsHelper
  include CartsHelper
  
  def attempt
    cookies[:attempt] ||= 1
  end

  def time_attempt
    cookies[:time] ||= Time.now.to_s
    Time.parse(cookies[:time])
  end

  def set_time_attempt
    cookies[:time] = Time.now
  end

  def increment_attempt_num
    cookies[:attempt] = attempt.to_i + 1
    set_time_attempt if attempt.to_i == 3 
  end
  
end


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method a built in rail tool to make what is called available in all VIEW TEMPLATES

  helper_method :current_user
  
  def current_user
  	@current_user ||= User.where(id: session[:user_id]).first
  end
end


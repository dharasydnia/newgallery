class ApplicationController < ActionController::Base
  include ControllerAuthentication
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

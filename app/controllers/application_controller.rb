class ApplicationController < ActionController::Base
  include ControllerAuthentication
  helper :all # include all helpers, all the time
  protect_from_forgery
end

class ApplicationController < ActionController::Base
  include SessionsHelper
  include SubsHelper
  protect_from_forgery
end

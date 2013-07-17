class ApplicationController < ActionController::Base
  include SessionsHelper
  include SubsHelper
  include ApplicationHelper

  protect_from_forgery
end

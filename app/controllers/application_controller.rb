class ApplicationController < ActionController::Base
  include SessionsHelper
  include SubsHelper
  include ApplicationHelper
  include LinksHelper

  protect_from_forgery
end

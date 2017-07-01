class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit
  protect_from_forgery with: :exception

  before_action :require_login
end

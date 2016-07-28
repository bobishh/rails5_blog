class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :null_session

  def index
  end

  def admin
  end
end

class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_session

  def set_session
    session[:source] = params[:q] if params[:q]
  end
end

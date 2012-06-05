class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged_in?

  def logged_in?
    unless params[:auth_token]
      render status: :unauthorized, :json => false
    end
  end
end
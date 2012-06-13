class ApplicationController < ActionController::Base
  # protect_from_forgery
  include ApplicationHelper
  before_filter :logged_in?

  def logged_in?
    render status: :unauthorized, :json => false unless params[:auth_token]
  end

end

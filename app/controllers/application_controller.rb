class ApplicationController < ActionController::Base
  include ApplicationHelper
  # before_filter :require_login

  def require_login
    unless session[:user_token] || params[:auth_token]
      if Rails.env.production?
        redirect_to "http://login.hackchat.in"
      else
        redirect_to "http://localhost:4000/"
      end
    end
  end
  
end

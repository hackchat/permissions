class UsersController < ApplicationController

  def show
    puts now = Time.now
    @permissions = UserRoomPermission.find_all_by_user_token(params[:id])
    if @permissions.present?
      render status: :ok, json: @permissions
    else
      render status: :ok, :json => []
    end
    puts Time.now - now
  end

end
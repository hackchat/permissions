class UsersController < ApplicationController

  def show
    @permissions = UserRoomPermission.find_all_by_user_token(params[:id])
    if @permissions.present?
      render status: :ok, json: @permissions
    else
      render status: :ok, :json => []
    end
  end

end
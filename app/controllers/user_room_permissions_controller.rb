class UserRoomPermissionsController < ApplicationController
  def show
    @permission = UserRoomPermission.find_permission(params[:room_token],
                                                    params[:user_token])
    render status: :unauthorized unless @permission
  end
end

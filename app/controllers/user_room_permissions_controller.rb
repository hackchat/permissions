class UserRoomPermissionsController < ApplicationController
  def show
    @permission = UserRoomPermission.find_permission(params[:room_number],
                                                    params[:user_token]
                                                    )
    render status: :unauthorized unless @permission

  end

  def create
    @permission = UserRoomPermission.create(:room_number => params[:room_number],
                                            :user_token => params[:user_token])
    render status: :created
  end
end
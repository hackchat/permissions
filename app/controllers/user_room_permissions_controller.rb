class UserRoomPermissionsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_permission(params[:room_token],
                                                    params[:user_token])
    render status: :unauthorized unless @permission

  end

  def create
    @permission = UserRoomPermission.new(:room_token => params[:room_token],
                                            :user_token => params[:user_token])
    if @permission.save
      render status: :created
    else
      render status: :forbidden
    end
  end

  def destroy
    @permission = UserRoomPermission.find_permission(params[:room_token],
                                                    params[:user_token])
    @permission.destroy
    render status: :deleted
  end
end
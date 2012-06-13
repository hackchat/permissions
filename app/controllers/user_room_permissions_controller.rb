class UserRoomPermissionsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_permission(params[:room_id],
                                                     params[:user_token])
    render status: :unauthorized unless @permission
  end

  def create
    @permission = UserRoomPermission.new(:room_id => params[:room_id],
                                         :user_token => params[:user_token])
    if @permission.save
      render status: :created, json: @permission
    else
      render status: :forbidden, json: false
    end
  end

  def destroy
    @permission = UserRoomPermission.find_permission(params[:id],
                                                     params[:user_token])
    @permission.destroy
    render status: :ok, json: true
  end

end

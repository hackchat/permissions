class UserRoomPermissionsController < ApplicationController

  def show
    if @permission = UserRoomPermission.find_permission(params[:room_id],
                                                     params[:user_token])
      render status: :ok
    else
      render status: :unauthorized
    end
  end

  def create
    @permission = UserRoomPermission.new(:room_id => params[:room_id],
                                         :user_token => params[:user_token],
                                         :owner => params[:owner])
    if @permission.save
      render status: :created, json: @permission
    else
      render status: :forbidden, json: false
    end
  end

  def destroy
    @permission = UserRoomPermission.find_permission(params["room_id"],
                                                     params["user_token"])
    @permission.destroy
    redirect_to "#{CHAT}rooms/#{params["room_id"]}/permissions"
  end

end

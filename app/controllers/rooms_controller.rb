class RoomsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_room_token(params[:id])
    if @permission.present?
      render status: :ok
    else
      render status: 500, :json => "This party is lame!"
    end
  end

  def destroy
    @permission = UserRoomPermission.find_permission(params[:id],
                                                    params[:user_token])
    @permission.destroy
    render status: :OK, json: true
  end

  def create
    @permission = UserRoomPermission.new(:room_number => params[:id],
                                            :user_token => params[:user_token])
    if @permission.save
      render status: :created, json: @permission
    else
      render status: :forbidden, json: false
    end
  end

  # DELETE /rooms/:room_id/permission?user_token=foo

end
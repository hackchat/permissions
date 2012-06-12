class RoomsController < ApplicationController

  def index
    
  end

  def show
    @permission = UserRoomPermission.find_all_by_room_id(params[:id])
    if @permission.present?
      render status: :ok
    else
      render status: 500, :json => "This party is lame!"
    end
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
class RoomsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_room_number(params[:id])
    if @permission.present?
      render status: :ok
    else
      render status: 500, :json => "This party is lame!"
    end
  end
end
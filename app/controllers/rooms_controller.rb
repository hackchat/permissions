class RoomsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_room_number(params[:id])
    render status: :unauthorized unless @permission
  end
end

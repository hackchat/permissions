class RoomsController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_room_number(params[:id])
    if @permission != []
      render status: :ok
    elsif @permission = []
      render status: :ok, :notice => "This party is lame"
    end
  end
end
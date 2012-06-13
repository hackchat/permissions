class RoomsController < ApplicationController

  def show
    @permissions = UserRoomPermission.find_all_by_room_id(params[:id])
    if @permissions.present?
      render status: :ok
    else
      render status: :ok
    end
  end

end
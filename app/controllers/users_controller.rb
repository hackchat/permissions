class UsersController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_user_token(params[:id])
    if @permission != []
      render status: :ok
    elsif @permission = []
      render status: :ok, :notice => "You are unpopular."
    end
  end
end

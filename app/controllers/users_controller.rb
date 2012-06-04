class UsersController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_user_token(params[:id])
    render status: :unauthorized unless @permission
  end
end

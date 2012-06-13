class UsersController < ApplicationController

  def show
    @permissions = UserRoomPermission.find_all_by_user_token(params[:id])
    if @permissions.present?
      render status: :ok
    else
      render status: 401, :json => []
    end
  end

end
class UsersController < ApplicationController

  def show
    @permission = UserRoomPermission.find_all_by_user_token(params[:id])
    if @permission.present?
      render status: :ok
    else
      render status: 401, :json => "You are unpopular."
    end
  end

end
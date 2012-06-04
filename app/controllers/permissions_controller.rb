class PermissionsController < ApplicationController
  def show
    if permission = Permission.find_by_room_and_user_token(params[:room],
                                                           params[:user_token])
      return { permission: true, owner: permission.owner }.to_json
    else
      return { permission: false }.to_json
  end

  def index

  end
end
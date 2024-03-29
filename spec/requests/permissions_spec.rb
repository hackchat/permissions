require 'spec_helper'

describe "UserRoomPermission", type: :api do
  let!(:user_room_permission) { FactoryGirl.create(:user_room_permission) }

  describe "GET /user_room_permission.json" do
    it "lists the permission" do
      get user_room_permission_path(
                                :user_token => user_room_permission.user_token,
                                :room_id => user_room_permission.room_id,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(200)
    end
    it "gives a 401 error if there is no permission" do
      get user_room_permission_path(
                                :user_token => "wrong",
                                :room_id => user_room_permission.room_id,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(401)
    end
  end

end
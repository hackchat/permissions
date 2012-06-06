require 'spec_helper'

describe "UserRoomPermission", type: :api do
  let!(:user_room_permission) { FactoryGirl.create(:user_room_permission) }

  describe "GET /user_room_permission.json" do
    it "lists the permission" do
      get user_room_permission_path(1,
                                :user_token => user_room_permission.user_token,
                                :room_token => user_room_permission.room_token,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(200)
      # response.body.should have_content user_room_permission.room_number
    end
    it "gives a 401 error if there is no permission" do
      get user_room_permission_path(1,
                                :user_token => "wrong",
                                :room_token => user_room_permission.room_token,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(401)
    end
  end
end
require 'spec_helper'

describe "UserRoomPermission", type: :api do
  let!(:user_room_permission) { FactoryGirl.create(:user_room_permission) }

  describe "GET /user_room_permission.json" do
    it "lists the permission" do
      get user_room_permission_path(1,
                                :user_token => user_room_permission.user_token,
                                :room_number => user_room_permission.room_number,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(200)
      # response.body.should have_content user_room_permission.room_number
    end
    it "gives a 401 error if there is no permission" do
      get user_room_permission_path(1,
                                :user_token => "wrong",
                                :room_number => user_room_permission.room_number,
                                :auth_token => "auth",
                                :format => "json")
      response.status.should be(401)
    end
  end
  it "can create a permission" do
    post user_room_permissions_path(:user_token => "blah",auth_token: "bep", room_number: "bam")
    response.status.should be(201)
  end
  it "can destroy a permission" do
    delete user_room_permission_path(:user_token => "blah",auth_token: "bep", room_number: "bam")
    response.status.should be(200)
  end

end
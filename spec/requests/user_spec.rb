require 'spec_helper'

describe "User", type: :api do

  describe "GET /users.json" do
    let!(:permission_1) { UserRoomPermission.create(:user_token => "tom",
                                                  :room_number => 15,
                                                  :owner => true) }
    it "lists the rooms to which user has permission" do
      get user_path(15, :user_token => permission_1.user_token,
                       :format => "json")
      response.status.should be(200)
      # response.body.should have_content user_permission.room_number
    end
    it "gives a notice that you have no rooms to access" do
      get user_path(56,
                                :user_token => "marvin",
                                :format => "json")
      response.status.should be(200)
      # response.body.should have_content "You are unpopular."
    end
  end
end
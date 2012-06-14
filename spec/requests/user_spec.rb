require 'spec_helper'

describe "User", type: :api do

  describe "GET /users.json" do
    let!(:permission_1) { UserRoomPermission.create(:user_token => "tom",
                                                  :room_id => "melanie",
                                                  :owner => true) }
    it "lists the rooms to which user has permission" do
      get user_path("tom", :auth_token => "hi", :format => "JSON")
      response.status.should be(200)
      body = JSON.parse(response.body)
      body[0]["user_token"].should == "tom"
    end
    it "gives a notice that you have no rooms to access" do
      get user_path(56,
                                :user_token => "marvin",
                                :format => "json",
                                :auth_token => "poth")
      response.body.should == "[]"
    end
  end
end
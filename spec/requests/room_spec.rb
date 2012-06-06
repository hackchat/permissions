require 'spec_helper'

describe "Room", type: :api do

  describe "GET /rooms.json" do
    let!(:permission_3) { UserRoomPermission.create(:user_token => "tom",
                                                  :room_token => "melanie",
                                                  :owner => true) }
    it "lists the users for a room" do
      get room_path(:room_token => "melanie", :auth_token => "hi", :format => "JSON")
      response.status.should be(200)
      body = JSON.parse(response.body)
      body[0]["user_token"].should == "tom"
    end

    it "gives a notice that there are no users for this room" do
      get room_path(98, :room_token => "098098",
                        :auth_token => "auth",
                        :format => "JSON")
      response.status.should be(500)
      response.body.should == "This party is lame!"
    end
  end
end
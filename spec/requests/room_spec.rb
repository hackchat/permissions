require 'spec_helper'

describe "Room", type: :api do

  describe "GET /rooms.json" do
    let!(:permission_3) { UserRoomPermission.create(:user_token => "tom",
                                                  :room_number => 4,
                                                  :owner => true) }
    it "lists the rooms to which user has permission" do
      get room_path(4, :format => "JSON")
      response.status.should be(200)
      body = JSON.parse(response.body)
      body[0]["room_number"].should == 4
    end
    it "gives a notice that there are no users for this room" do
      get room_path(98,
                                :room_number => "098098",
                                :format => "JSON")
      response.status.should be(500)

      response.body.should == "This party is lame!"
    end
  end
end
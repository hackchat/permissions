require 'spec_helper'

describe "Room", type: :api do

  describe "GET /rooms.json" do
    let!(:permission_3) { UserRoomPermission.create(:user_token => "tom",
                                                  :room_number => 4,
                                                  :owner => true) }
    it "lists the rooms to which user has permission" do
      get room_path(4, :user_token => permission_3.room_number,
                       :format => "json")
      response.status.should be(200)
      # response.body.should have_content user_permission.room_number
    end
    it "gives a notice that there are no users for this room" do
      get room_path(98,
                                :room_number => "098098",
                                :format => "json")
      response.status.should be(200)
      # response.body.should have_content "This party is lame."
    end
  end
end
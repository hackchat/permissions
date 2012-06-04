class UserRoomPermission < ActiveRecord::Base
  attr_accessible :user_token, :room_number, :owner

  def self.find_permission(room, user_token)
    UserRoomPermission.where(:room_number => room,
                             :user_token => user_token).first
  end

end
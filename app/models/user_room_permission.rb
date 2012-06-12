class UserRoomPermission < ActiveRecord::Base

  attr_accessible :user_token, :room_token, :owner
  validates_uniqueness_of :room_token, :scope => [:user_token]

  def self.find_permission(room, user_token)
    UserRoomPermission.where(:room_token => room,
                             :user_token => user_token).first
  end
end
class UserRoomPermission < ActiveRecord::Base
  attr_accessible :user_token, :room_id, :owner
  validates_uniqueness_of :room_id, :scope => [:user_token]
  validates_presence_of :room_id
  validates_presence_of :user_token

  def self.find_permission(room, user_token)
    UserRoomPermission.where(:room_id => room,
                             :user_token => user_token).first
  end

end
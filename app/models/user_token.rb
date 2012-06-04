class UserToken < ActiveRecord::Base
  belongs_to :room, :through => :permissions
end

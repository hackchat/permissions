class Room < ActiveRecord::Base
  belongs_to :user_token, :through => :permissions
end

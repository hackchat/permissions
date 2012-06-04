class Permission < ActiveRecord::Base
  attr_accessible :user_token_id, :room_id, :owner

  has_one :user_token_id
  has_one :room_id

  def find_by_room_and_user_token(room_id, user_token_id)
    Permission.where(:room_id => room_id, :user_token_id => user_token_id)
  end

  def find_by_room
    index
  end

  def find_by_user
    index
  end

end




# UserTokens
#   t.string :token

# Rooms
#   t.integer :room_number

# Permissions
#   t.integer :room_id
#   t.integer :user_token_id
#   t.bool :owner


# if permission = Permission.find_by_room_and_user_token(params[:room_number], params[:user_token])
#   return { permission: true, owner: permission.owner }.to_json
# else
#   return { permission: false }.to_json

# Permission.find_by_user_token("aksjdfhklasdhciuqrb")
# # => [ [room_id: 17, owner: false] [ room_id: 94, owner: true] ]
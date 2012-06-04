class AddUserTokenAndRoomIdAndOwnerToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :user_token_id, :integer
    add_column :permissions, :room_id, :integer
    add_column :permissions, :owner, :boolean
  end
end

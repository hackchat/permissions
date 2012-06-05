class ChangeOwnerToDefaultToFalse < ActiveRecord::Migration
  def up
    change_column(:user_room_permissions, :owner, :boolean, :default => false)
  end

  def down
  end
end
class CreateUserRoomPermissions < ActiveRecord::Migration
  def change
    create_table :user_room_permissions do |t|
      t.string :user_token
      t.string :room_token
      t.boolean :owner, :default => false
      t.timestamps
    end
  end
end

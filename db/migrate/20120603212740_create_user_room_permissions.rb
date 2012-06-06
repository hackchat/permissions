class CreateUserRoomPermissions < ActiveRecord::Migration
  def change
    create_table :user_room_permissions do |t|
      t.string :user_token
      t.integer :room_number
      t.boolean :owner
      t.timestamps
    end
  end
end

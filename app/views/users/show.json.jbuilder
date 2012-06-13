json.array!(@permissions) do |json, permission|
  json.(permission, :user_token, :room_id, :owner)
end
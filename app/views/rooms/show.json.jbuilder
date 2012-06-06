json.array!(@permission) do |json, permission|
  json.(permission, :user_token, :room_token, :owner)
end
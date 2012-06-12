if @permission
  json.(@permission, :user_token, :room_id, :owner)
else
  json.permission false
end
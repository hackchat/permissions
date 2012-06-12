if @permission
  json.(@permission, :user_token, :room_token, :owner)
else
  json.permission false
end
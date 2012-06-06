if @permission
  json.(@permission, :user_token, :room_number, :owner)
else
  json.permission false
end
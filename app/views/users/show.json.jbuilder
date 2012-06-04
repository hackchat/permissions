@permission.each do |permission|
  json.(permission, :user_token, :room_number, :owner)
end
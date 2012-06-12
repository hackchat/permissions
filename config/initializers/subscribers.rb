REDIS_URL = "redis://redistogo:b8a6ecd52bed232f3d391126f0a9471c@dogfish.redistogo.com:9010"
REDIS_URI = URI.parse(REDIS_URL)
REDIS = Redis.new(host: REDIS_URI.host, port: REDIS_URI.port, password: REDIS_URI.password)

Thread.new do
  REDIS.subscribe("create") do |s|
    s.message do |c,m|
      parsed_json = JSON.parse(m)
      if parsed_json["type"] == "room"
        room = parsed_json["room"]
        UserRoomPermission.create(room_id: room["room_id"], user_token: room["user_token"], owner: true)
      elsif parsed_json["type"] == "permission"
        room = parsed_json["room"]
        UserRoomPermission.create(room_id: room["room_id"], user_token: room["user_token"])
      end
    end
  end
end
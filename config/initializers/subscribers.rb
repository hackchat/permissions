Thread.new do
  create_subscriber = Subscriber.new('create') do |parsed_json, type|
    model = type.camelize.constantize
    if model == UserRoomPermission
      if parsed_json[type].keys.all? { |key| model.accessible_attributes.include?(key) }
        model.create(parsed_json[type])
      end
    end
  end
end

# Thread.new do
#   create_subscriber = Subscriber.new('destroy') do |parsed_json, type|
#     model = type.camelize.constantize
#     if model == UserRoomPermission
#       if parsed_json[type].keys.all? { |key| model.accessible_attributes.include?(key) }
#         model.create(parsed_json[type])
#       end
#     end
#   end
# end
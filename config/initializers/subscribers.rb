Thread.new do
  create_subscriber = Subscriber.new('create') do |parsed_json|
    model = parsed_json["type"].camelize.constantize
    if model == UserRoomPermission
      if parsed_json["attributes"].keys.all? { |key| model.accessible_attributes.include?(key) }
        model.create(parsed_json["attributes"])
      end
    end
  end
end
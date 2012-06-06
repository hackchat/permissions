FactoryGirl.define do
  factory :user_room_permission do
    sequence(:user_token) { |n| "iamafactorytoken#{n}" }
    sequence(:room_token) { |p| "iamaroomtoken#{p}" }
    owner true
  end
end
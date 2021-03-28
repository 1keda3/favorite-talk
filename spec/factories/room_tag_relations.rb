FactoryBot.define do
  factory :room_tag_relation do
    association :room
    association :tag
  end
end
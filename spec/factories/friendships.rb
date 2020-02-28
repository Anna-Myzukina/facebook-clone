FactoryBot.define do
  factory :friendship do
    user_id { nil }
    friend_id { nil }
    confirmed { false }
  end
end

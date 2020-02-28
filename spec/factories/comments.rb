FactoryBot.define do
  factory :comment do
    user_id { nil }
    post_id { nil }
    content { 'My first comment' }
  end
end

FactoryBot.define do
  factory :poll do
    title { "Poll title 1" }
    description { "Poll description 1" }
    association :user
  end
end

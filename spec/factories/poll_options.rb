FactoryBot.define do
  factory :poll_option do
    title { "Poll option title 1" }
    description { "Poll option description 1" }
    association :user
    association :poll
  end
end

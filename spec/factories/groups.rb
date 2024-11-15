FactoryBot.define do
  factory :group do
    title { "Group title 1" }
    description { "Group description 1" }
    association :user
  end
end

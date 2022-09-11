FactoryBot.define do
  factory :conference do
    sequence(:title) { |n| "Conference #{n}" }
  end
end

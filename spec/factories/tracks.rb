FactoryBot.define do
  factory :track do
    sequence(:title) { |n| "Track #{n}" }
    conference
  end
end

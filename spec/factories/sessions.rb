FactoryBot.define do
  factory :session do
    shift { [ "Manhã", "Tarde"].sample }
    track
  end
end

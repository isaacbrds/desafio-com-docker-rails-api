
FactoryBot.define do
  factory :lecture do
    title { Faker::Game.title }
    attendee { Faker::Games::Heroes.name }
    start_time { "2022-10-20 09:00" }
    session 
  end
end

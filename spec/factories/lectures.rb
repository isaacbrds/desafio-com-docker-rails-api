FactoryBot.define do
  factory :lecture do
    title { "Rails como Programar" }
    attendee { "Jackson Pires" }
    start_time { "2022-09-11 09:00:01" }
    end_time { "2022-09-11 09:50:01" }
    session
  end
end

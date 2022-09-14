FactoryBot.define do
  factory :conference do
    sequence(:title) { |n| "Conference #{n}" }    
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/arq.txt")) }
  end
end

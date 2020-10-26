FactoryBot.define do
  factory :submission do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email_address { Faker::Internet.email }
    slogan { Faker::Lorem.paragraph }
  end
end
FactoryBot.define do
  factory :user do
    name { Faker::Movies::HarryPotter::character }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    api_key { Faker::Internet.password }
  end
end

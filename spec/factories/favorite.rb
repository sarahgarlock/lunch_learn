FactoryBot.define do
  factory :favorite do
    country { Faker::Movies::HarryPotter.location }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Movies::HarryPotter.spell }
    association :user # This will create an associated user with a generated api_key
  end
end
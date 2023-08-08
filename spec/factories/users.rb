FactoryBot.define do
  factory :user do
    name { Faker::DcComics.name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    # password_confirmation { Faker::Internet.password } ?
    # needs to be same as password_digest
    api_key { Faker::Internet.password }
  end
end

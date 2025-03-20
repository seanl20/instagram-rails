FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    password { "password" }
    email { Faker::Internet.email }
  end
end

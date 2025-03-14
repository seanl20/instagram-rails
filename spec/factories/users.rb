FactoryBot.define do
  factory :user do
    username { Faker::Internet.username.unique }
  end
end

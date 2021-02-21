FactoryBot.define do
  factory :meal do
    menu { Faker::Lorem.characters(number:10) }
    amount { Faker::Number.number(digits: 3) }
  end
end

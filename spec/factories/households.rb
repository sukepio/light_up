FactoryBot.define do
  factory :household do
    head_first_name { '博' }
    head_last_name { '日本' }
    living_space { Faker::Lorem.characters(number: 5) }
    address { Faker::Lorem.characters(number: 5) }
    house_damage_situation { Faker::Lorem.characters(number: 15) }
  end
end

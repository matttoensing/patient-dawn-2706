FactoryBot.define do
  factory :player do
    name { Faker::Name.name  }
    age { Faker::Number.between(from: 21, to: 45) }
  end
end

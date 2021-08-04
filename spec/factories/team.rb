FactoryBot.define do
  factory :team do
    nickname { Faker::Team.name }
    hometown { Faker::Team.state }
  end
end

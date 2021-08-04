FactoryBot.define do
  factory :competition do
    name { Faker::Sports::Football.competition  }
    location { Faker::Team.state  }
    sport { Faker::Team.sport }
  end
end

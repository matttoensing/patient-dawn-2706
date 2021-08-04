require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:competition_teams) }
    it { should have_many(:competitions).through(:competition_teams) }
  end

  describe 'class methods' do
    describe '::average_age_of_players' do
      it 'returns teams sorted by average player age in asending order and also a column for average player age' do
        team1 = create(:team)
        player1 = create(:player, age: 33, team: team1)
        player2 = create(:player, age: 35, team: team1)
        team2 = create(:team)
        player1 = create(:player, age: 28, team: team2)
        player2 = create(:player, age: 32, team: team2)

        expected = [team1, team2]
        result = Team.average_age_of_players

        expect(result[0].avg_age).to eq(34)
        expect(result[1].avg_age).to eq(30)
      end
    end
  end
end

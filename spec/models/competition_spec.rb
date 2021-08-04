require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_teams) }
    it { should have_many(:teams).through(:competition_teams) }
  end

  describe 'instance methods' do
    describe '#average_player_age' do
      it 'returns the average age of all players associated with teams in the competition' do
        competition = create(:competition)
        team1 = create(:team)
        player1 = create(:player, age: 33, team: team1)
        player2 = create(:player, age: 37, team: team1)
        team2 = create(:team)
        player3 = create(:player, age: 28, team: team2)
        player4 = create(:player, age: 32, team: team2)
        comp_team1 = CompetitionTeam.create(team: team1, competition: competition)
        comp_team2 = CompetitionTeam.create(team: team2, competition: competition)

        expect(competition.average_player_age).to eq(32)
      end
    end
  end
end

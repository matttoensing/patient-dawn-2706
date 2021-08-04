require 'rails_helper'

RSpec.describe 'teams index page' do
  describe 'contents' do
    it 'visitor sees nicknames of all teams' do
      team1 = create(:team)
      team2 = create(:team)

      visit '/teams'

        expect(page).to have_content(team1.nickname)
        expect(page).to have_content(team2.nickname)
    end

    it 'displays the average age of its players sorted from highest to lowest' do
      team1 = create(:team)
      player1 = create(:player, age: 33, team: team1)
      player2 = create(:player, age: 35, team: team1)
      team2 = create(:team)
      player1 = create(:player, age: 28, team: team2)
      player2 = create(:player, age: 32, team: team2)
      sorted_teams = Team.average_age_of_players

      visit '/teams'

      expect(team1.nickname).to appear_before(team2.nickname)
      expect(page).to have_content(sorted_teams[0].avg_age)
      expect(page).to have_content(sorted_teams[1].avg_age)
    end
  end
end

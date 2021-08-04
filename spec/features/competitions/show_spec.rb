require 'rails_helper'

RSpec.describe 'competition show page' do
  describe 'contents' do
    it 'visitor sees names, location and sport of the competition' do
      competition = create(:competition)

      visit "/competitions/#{competition.id}"

      expect(page).to have_content(competition.name)
      expect(page).to have_content("Location: #{competition.location}")
      expect(page).to have_content("Sport: #{competition.sport}")
    end

    it 'page displays the nickname and hometown of all teams in the competition' do
      competition = create(:competition)
      team1 = create(:team)
      team2 = create(:team)
      comp_team1 = CompetitionTeam.create(team: team1, competition: competition)
      comp_team2 = CompetitionTeam.create(team: team2, competition: competition)

      visit "/competitions/#{competition.id}"

      within "#team-#{team1.id}" do
        expect(page).to have_content("Nickname: #{team1.nickname}")
        expect(page).to have_content("Hometown: #{team1.hometown}")
      end

      within "#team-#{team2.id}" do
        expect(page).to have_content("Nickname: #{team2.nickname}")
        expect(page).to have_content("Hometown: #{team2.hometown}")
      end
    end
  end

  describe 'average player age statistic' do
    it 'displays the average age of all player in the competition on the page' do
      competition = create(:competition)
      team1 = create(:team)
      player1 = create(:player, team: team1)
      player2 = create(:player, team: team1)
      team2 = create(:team)
      player3 = create(:player, team: team2)
      player4 = create(:player, team: team2)
      comp_team1 = CompetitionTeam.create(team: team1, competition: competition)
      comp_team2 = CompetitionTeam.create(team: team2, competition: competition)

      visit "/competitions/#{competition.id}"

      expect(page).to have_content(competition.average_player_age)
    end
  end
end

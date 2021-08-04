require 'rails_helper'

RSpec.describe 'new team registration page' do
  describe 'reggistration form' do
    it 'visitor can fill out the form to register a team' do
      competition = create(:competition)
      team1 = create(:team)

      visit "/competitions/#{competition.id}/teams/new"
      
      fill_in 'nickname', with: team1.nickname
      fill_in 'hometown', with: team1.hometown
      click_on 'Submit'

      expect(current_path).to eq("/competitions/#{competition.id}")
      expect(page).to have_content(team1.nickname)
      expect(page).to have_content(team1.hometown)
      # As a user
      # When I visit a competition's show page
      # Then I see a link to register a new team
      # When I click this link
      # Then I am taken to a new page where I see a form
      # When I fill in this form with a team's hometown and nickname
      # And I click submit
      # Then I am redirected back to the competition's show page
      # And I see the new team I created listed
    end
  end
end

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

    it '' do
      # As a user
      # When I visit a competition's show page
      # Then I see the competition's name, location, and sport
      # And I see the nickname and hometown of all teams in this competition
      # And I see the average age of all players in the competition
    end
  end
end

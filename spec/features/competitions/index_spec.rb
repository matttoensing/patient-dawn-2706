require 'rails_helper'

RSpec.describe 'competitions index page' do
  describe 'contents' do
    it 'visitor sees the names of all competitions on page' do
      competition1 = create(:competition)
      competition2 = create(:competition)
      competition3 = create(:competition)

      visit '/competitions'

      within "#competition-#{competition1.id}" do
        expect(page).to have_content("Name: #{competition1.name}")
      end

      within "#competition-#{competition2.id}" do
        expect(page).to have_content("Name: #{competition2.name}")
      end

      within "#competition-#{competition3.id}" do
        expect(page).to have_content("Name: #{competition3.name}")
      end
    end
  end

  it 'visitor sees a link for each competition to its show page' do
    competition1 = create(:competition)
    competition2 = create(:competition)
    competition3 = create(:competition)

    visit '/competitions'

    within "#competition-#{competition1.id}" do
      expect(page).to have_link(competition1.name)
    end

    within "#competition-#{competition2.id}" do
      expect(page).to have_link(competition2.name)
    end

    within "#competition-#{competition3.id}" do
      expect(page).to have_link(competition3.name)
    end
  end
end

require "rails_helper"

RSpec.describe "Merchants Index" do
  describe 'happy paths' do
    it 'should display a list of merchants by name', :vcr do
      merchants = EngineFacade.new.merchants

      visit merchants_path

      expect(page).to have_content('Merchants')

      within '.merchants-index' do
        expect(page).to have_css('.merchant', count: 100)

        expect(page).to have_content(merchants[0].name)
        expect(page).to have_content(merchants[1].name)
        expect(page).to have_content(merchants[2].name)
      end
    end

    it 'has each merchants name as a link to their show page', :vcr do
      merchants = EngineFacade.new.merchants

      visit merchants_path

      within '.merchants-index' do
        expect(page).to have_link(merchants[0].name)
        expect(page).to have_link(merchants[1].name)
        expect(page).to have_link(merchants[2].name)

        click_link(merchants[0].name)

        expect(current_path).to eq(merchant_path(merchants[0].id))
      end
    end
  end
end
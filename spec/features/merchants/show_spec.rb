require "rails_helper"

RSpec.describe "Merchants Show" do
  describe 'happy paths' do
    it 'should display a list of items this merchant sells', :vcr do
      merchant = EngineFacade.new(1).merchant
      items = EngineFacade.new(1).merchants_items
      
      visit merchant_path(merchant.id)

      expect(page).to have_content(merchant.name)

      within ".merchant-#{merchant.id}-items" do
        expect(page).to have_css('.item', count: items.count)

        expect(page).to have_content(items[0].name)
        expect(page).to have_content(items[1].name)
        expect(page).to have_content(items[2].name)
      end
    end
  end
end
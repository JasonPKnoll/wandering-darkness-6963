require 'rails_helper'

RSpec.describe Plots do
  describe 'plots index page' do
    before(:each) do
      @garden = Garden.create!(name: "Turing Comunity Garden", organic: true)
      @plot_1 = Plot.create!(number: 25, size: "Large", direction: "East")
      @plot_2 = Plot.create!(number: 20, size: "Medium", direction: "Weast")
      @plot_3 = Plot.create!(number: 15, size: "Small", direction: "Southish")

      @plant_1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers  rich, well draining soil", days_to_harvest: 90)
      @plant_2 = Plant.create!(name: "White Lotus", description: "Extreamly Rare", days_to_harvest: 365)
      @plant_3 = Plant.create!(name: "Spikey plant of def", description: "Prefers to be left alone", days_to_harvest: 30)
      @plant_4 = Plant.create!(name: "Potato", description: "Prefers straight up dirt", days_to_harvest: 60)
      @plant_5 = Plant.create!(name: "Amaranth", description: "A purple grain cultivated by an ancient civilization", days_to_harvest: 7)

      Assignment.create!(plot: @plot_1, plant: @plant_1)
      Assignment.create!(plot: @plot_1, plant: @plant_4)
      Assignment.create!(plot: @plot_1, plant: @plant_3)
      Assignment.create!(plot: @plot_2, plant: @plant_2)
      Assignment.create!(plot: @plot_2, plant: @plant_5)
      Assignment.create!(plot: @plot_3, plant: @plant_4)

      visit "/plots"
    end

    it 'shows list of all plot numbers' do
      expect(page).to have_content("25")
      expect(page).to have_content("20")
      expect(page).to have_content("15")
    end

    it 'shows the name of each plot plant under numbers' do
      within "#plot-#{@plot_1.id}" do
        expect(page).to have_content("#{@plant_1.name}")
        expect(page).to have_content("#{@plant_4.name}")
        expect(page).to have_content("#{@plant_3.name}")
      end
      within "#plot-#{@plot_2.id}" do
        expect(page).to have_content("#{@plant_2.name}")
        expect(page).to have_content("#{@plant_5.name}")
      end
      within "#plot-#{@plot_3.id}" do
        expect(page).to have_content("#{@plant_4.name}")
      end
    end
  end
end

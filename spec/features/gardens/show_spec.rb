require 'rails_helper'

RSpec.describe Garden do
  describe 'gardens show page' do
    before(:each) do
      @garden = Garden.create!(name: "Turing Comunity Garden", organic: true)
      @garden_2 = Garden.create!(name: "Desert Garden", organic: false)
      @plot_1 = @garden.plots.create!(number: 25, size: "Large", direction: "East")
      @plot_2 = @garden.plots.create!(number: 20, size: "Medium", direction: "Weast")
      @plot_3 = @garden.plots.create!(number: 15, size: "Small", direction: "Southish")
      @plot_4 = @garden_2.plots.create!(number: 15, size: "Small", direction: "North")


      @plant_1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers  rich, well draining soil", days_to_harvest: 90)
      @plant_2 = Plant.create!(name: "White Lotus", description: "Extreamly Rare", days_to_harvest: 365)
      @plant_3 = Plant.create!(name: "Spikey plant of def", description: "Prefers to be left alone", days_to_harvest: 30)
      @plant_4 = Plant.create!(name: "Potato", description: "Prefers straight up dirt", days_to_harvest: 60)
      @plant_5 = Plant.create!(name: "Amaranth", description: "A purple grain cultivated by an ancient civilization", days_to_harvest: 7)
      @plant_6 = Plant.create!(name: "Sweet Gem Berry", description: "It's by far the sweetest thing you've ever smelled.", days_to_harvest: 24)


      Assignment.create!(plot: @plot_1, plant: @plant_1)
      Assignment.create!(plot: @plot_1, plant: @plant_4)
      Assignment.create!(plot: @plot_1, plant: @plant_3)
      Assignment.create!(plot: @plot_2, plant: @plant_2)
      Assignment.create!(plot: @plot_2, plant: @plant_5)
      Assignment.create!(plot: @plot_3, plant: @plant_4)
      Assignment.create!(plot: @plot_4, plant: @plant_6)

      visit "/gardens/#{@garden.id}"
    end

    it "can visit the garden" do
      expect(current_path).to eq(garden_path(@garden.id))
    end

    it 'shows a list of all plants in this garden' do
      save_and_open_page
      # Less than 100 days to harvest with no duplicates
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_3.name)
      expect(page).to have_content(@plant_4.name)
      expect(page).to have_content(@plant_5.name)

      # Over 100 days to harvest
      expect(page).to_not have_content(@plant_2.name)
        # Apart of Garden 2 not Garden 1
      expect(page).to_not have_content(@plant_6.name)
    end
  end
end

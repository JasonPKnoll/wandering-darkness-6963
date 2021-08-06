require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:assignments) }
    it { should have_many(:plots).through(:assignments)}
  end

  describe 'instance methods' do
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
      Assignment.create!(plot: @plot_2, plant: @plant_1)
      Assignment.create!(plot: @plot_2, plant: @plant_5)
      Assignment.create!(plot: @plot_2, plant: @plant_4)
      Assignment.create!(plot: @plot_3, plant: @plant_4)
      Assignment.create!(plot: @plot_4, plant: @plant_6)
    end
    it "lists all plants with no duplicates and none over 100 days to harvest" do
      expect(@garden.all_plants).to eq([@plant_5.name, @plant_4.name, @plant_1.name, @plant_3.name])
    end

    xit "orders the plants by how often they appear in plots" do
      expect(@garden.all_plants).to eq([@plant_4.name, @plant_1.name, @plant_5.name, @plant_3.name])
    end
  end
end

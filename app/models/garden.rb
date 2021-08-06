class Garden < ApplicationRecord
  has_many :plots

  def all_plants
    x= plots.joins(:plants)
          .select("plants.name, plot.plants.name.count as name_count")
          .group(:name)
          .where("plants.days_to_harvest < ?", 100)
          .pluck("plants.name")
          # require "pry"; binding.pry
  end
end

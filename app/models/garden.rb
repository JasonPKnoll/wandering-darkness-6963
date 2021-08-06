class Garden < ApplicationRecord
  has_many :plots

  def all_plants
    plots.joins(:plants)
          .select("plants.name")
          .group(:name)
          .where("plants.days_to_harvest < ?", 100)
          .pluck(:name)
  end
end

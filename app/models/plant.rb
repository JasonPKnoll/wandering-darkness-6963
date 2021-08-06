class Plant < ApplicationRecord
  has_many :assignments
  has_many :plots, through: :assignments
end

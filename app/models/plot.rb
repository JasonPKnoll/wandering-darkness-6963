class Plot < ApplicationRecord
  belongs_to :garden
  has_many :assignments
  has_many :plants, through: :assignments
end

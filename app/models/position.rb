class Position < ApplicationRecord
  has_many :bus_stops
  belongs_to :zone
end

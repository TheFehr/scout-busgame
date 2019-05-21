class BusStop < ApplicationRecord
  has_one :bus_line
  has_one :position
end

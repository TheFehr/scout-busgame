class BusStop < ApplicationRecord
  belongs_to :bus_line
  belongs_to :position
end

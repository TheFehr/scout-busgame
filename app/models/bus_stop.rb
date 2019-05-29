# frozen_string_literal: true

class BusStop < ApplicationRecord
  belongs_to :bus_line
  belongs_to :position
end

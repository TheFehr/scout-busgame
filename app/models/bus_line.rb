# frozen_string_literal: true

class BusLine < ApplicationRecord
  has_many :bus_stops, dependent: :restrict_with_error
end

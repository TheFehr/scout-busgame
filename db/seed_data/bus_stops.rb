# frozen_string_literal: true

require 'json'

file = File.read(Rails.root.join('db', 'seed_data', 'bus_stops.json'))
data_hash = JSON.parse(file, symbolize_names: true)

data_hash.each do |value|
  # p value[:position_name]

  BusStop.create!(
    bus_line: BusLine.find(value[:bus_line_id]),
    position: Position.find_by(name: value[:position_name])
  )
end

# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @positions = []

    BusStop.includes(position: :zone).all.order(:position_id).each do |stop|
      current_pos_id = stop.position_id

      unless @positions[current_pos_id].nil?
        @positions[current_pos_id][:bus_lines] = "#{@positions[current_pos_id][:bus_lines]}, #{stop.bus_line_id}"
        next
      end

      position = {
        id: current_pos_id,
        name: stop.position.name,
        zone: stop.position.zone,
        bus_lines: stop.bus_line_id
      }
      @positions.insert(current_pos_id, position)
    end

    @positions.compact!
  end
end

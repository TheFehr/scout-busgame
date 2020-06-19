# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :load_groups
  before_action :load_zones
  before_action :load_permits

  def index
    @positions = load_positions
  end

  private

  def load_positions
    positions = []

    BusStop.includes(position: [{ occupations: [:group] }, :zone]).all.order(:position_id).each do |stop|
      current_pos_id = stop.position_id

      if positions[current_pos_id]
        positions[current_pos_id][:bus_lines] =
          "#{positions[current_pos_id][:bus_lines]}, #{stop.bus_line_id}"
        next
      end

      current_position = stop.position
      current_occupation = current_position.last_valid_occupation || Occupation.new

      position = {
        id: current_pos_id,
        name: current_position.name,
        zone: current_position.zone_id || 100,
        bus_lines: stop.bus_line_id,
        points: current_position.points,
        main_position: current_position.main_position,
        occupation: current_occupation,
        occupied: current_position.occupied?
      }
      positions.insert(current_pos_id, position)
    end

    positions.compact!
    positions.sort_by! { |position| position[:zone] }
  end

  def load_permits
    @permits = Permit.all.includes(:permit_prices)
  end

  def load_groups
    @groups = Group.all.collect { |p| [p.name, p.id] }
  end

  def load_zones
    @zones = Zone.all.includes(:positions)
  end
end

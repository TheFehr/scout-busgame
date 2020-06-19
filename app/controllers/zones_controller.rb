# frozen_string_literal: true

class ZonesController < ApplicationController
  before_action :set_groups
  before_action :set_zone

  def update
    @error = validate_zone
    render 'zones/error' if @error

    if @zone.update(update_params)
      @group.update(money: (@group.money - @zone.price))
      return render 'zones/update'
    end

    render 'zones/error'
  end

  private

  def validate_zone
    return 'Nicht alle Busstationen sind besetzt!' unless all_occupied?
    return 'Haupt-Busstationen ist nicht durch Gruppe besetzt!' unless main_occupied_by_group?

    find_group
    'Nicht genügend Guthaben!' unless group_has_enough_money?
  end

  def group_has_enough_money?
    @group.money >= @zone.price
  end

  def main_occupied_by_group?
    @zone.main_station.last_valid_occupation.group_id == update_params[:group_id].to_i
  end

  def all_occupied?
    @zone.positions.none?(&:occupied?)
  end

  def find_group
    @group = Group.find(update_params[:group_id])
  end

  def set_groups
    @groups = Group.all.collect { |p| [p.name, p.id] }
  end

  def set_zone
    @zone = Zone.find(update_params[:id])
  end

  def update_params
    params.require(:zone).permit(:id, :group_id)
  end
end

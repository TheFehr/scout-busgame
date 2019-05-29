# frozen_string_literal: true

class ZonesController < ApplicationController
  before_action :set_groups
  before_action :set_zone

  def update
    @error = 'Nicht alle Busstationen sind besetzt!'
    return render 'zones/error' unless not_all_occupied?

    @error = 'Haupt-Busstationen ist nicht durch Gruppe besetzt!'
    return render 'zones/error' unless main_not_occupied_by_group?

    find_group

    @error = 'Nicht genügend Guthaben!'
    return render 'zones/error' unless group_has_not_money?

    if @zone.update(update_params)
      @group.update(money: (@group.money - @zone.price))
      return render 'zones/update'
    end

    @error = 'WHAT?'
    render 'zones/error'
  end

  private

  def group_has_not_money?
    @group.money >= @zone.price
  end

  def main_not_occupied_by_group?
    @zone.main_station.last_valid_occupation.group_id == update_params[:group_id].to_i
  end

  def not_all_occupied?
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

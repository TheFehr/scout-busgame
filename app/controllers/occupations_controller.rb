# frozen_string_literal: true

class OccupationsController < ApplicationController
  before_action :set_position, only: [:create]

  def create
    # respond_to do |format|
    #   format.js do
    @occupation = Occupation.new(occupation_params)

    raise ValidationError, @occupation.errors unless @occupation.save

    group = @occupation.group
    group.update(money: group.money += @occupation.position.points)

    render 'create'
    #   end
    # end
  end

  private

  def set_position
    @position = Position.find(occupation_params[:position_id])
  end

  def occupation_params
    params.require(:occupation).permit(:group_id, :position_id)
  end
end

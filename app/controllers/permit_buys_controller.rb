# frozen_string_literal: true

class PermitBuysController < ApplicationController
  before_action :set_groups
  before_action :set_permit_price, only: :create
  before_action :set_permit_buy, only: :update

  def create
    find_group

    @error = 'Nicht genügend Guthaben!'
    return render 'permit_buys/error' unless group_has_not_money?

    if PermitBuy.create(create_params)
      @group.update(money: (@group.money - @permit_price.price))
      @message = 'Erfolgreich gekauft!'
      return render 'permit_buys/create'
    end

    @error = 'WHAT?'
    render 'zones/error'
  end

  def update
    render 'permit_buys/update' if @permit_buy.update(update_params)
  end

  private

  def find_group
    @group = Group.find(create_params[:group_id])
  end

  def set_groups
    @groups = Group.all.collect { |group| [group.name, group.id] }
  end

  def set_permit_buy
    @permit_buy = PermitBuy.find(update_params[:id])
  end

  def set_permit_price
    @permit_price = PermitPrice.find(create_params[:permit_price_id])
  end

  def group_has_not_money?
    @group.money >= @permit_price.price
  end

  def create_params
    params.require(:permit_buy).permit(:permit_price_id, :group_id)
  end

  def update_params
    params.require(:permit_buy).permit(:id, :used)
  end
end

# frozen_string_literal: true

class PermitPricesController < ApplicationController
  before_action :set_permit_price, only: %i[show edit update destroy]
  before_action :set_permits

  # GET /permit_prices
  # GET /permit_prices.json
  def index
    @permit_prices = PermitPrice.all
  end

  # GET /permit_prices/1
  # GET /permit_prices/1.json
  def show; end

  # GET /permit_prices/new
  def new
    @permit_price = PermitPrice.new
  end

  # GET /permit_prices/1/edit
  def edit; end

  # POST /permit_prices
  # POST /permit_prices.json
  def create
    @permit_price = PermitPrice.new(permit_price_params)

    respond_to do |format|
      if @permit_price.save
        format.html { redirect_to permit_prices_url, notice: 'Permit price was successfully created.' }
        format.json { render :show, status: :created, location: @permit_price }
      else
        format.html { render :new }
        format.json { render json: @permit_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permit_prices/1
  # PATCH/PUT /permit_prices/1.json
  def update
    respond_to do |format|
      if @permit_price.update(permit_price_params)
        format.html { redirect_to permit_prices_url, notice: 'Permit price was successfully updated.' }
        format.json { render :show, status: :ok, location: @permit_price }
      else
        format.html { render :edit }
        format.json { render json: @permit_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permit_prices/1
  # DELETE /permit_prices/1.json
  def destroy
    @permit_price.destroy
    respond_to do |format|
      format.html { redirect_to permit_prices_url, notice: 'Permit price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_permits
    @permits = Permit.all.collect { |p| [p.name, p.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_permit_price
    @permit_price = PermitPrice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permit_price_params
    params.require(:permit_price).permit(:price, :permit_id)
  end
end

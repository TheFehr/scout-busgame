# frozen_string_literal: true

class Zone < ApplicationRecord
  has_many :positions, dependent: :restrict_with_error
  belongs_to :group, optional: true

  def price
    (positions.sum(:points) / 2).to_f.ceil
  end

  def main_station
    positions.select(&:main_position?)[0]
  end
end

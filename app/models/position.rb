# frozen_string_literal: true

class Position < ApplicationRecord
  has_many :bus_stops, dependent: :restrict_with_error
  has_many :occupations, dependent: :restrict_with_error
  belongs_to :zone, optional: true

  validates :name, uniqueness: true

  def last_valid_occupation
    return nil if occupations.last.nil?

    return occupations.last if (occupations.last.created_at + 30.minutes) > Time.zone.now

    nil
  end

  def occupied?
    last_valid_occupation.nil?
  end
end

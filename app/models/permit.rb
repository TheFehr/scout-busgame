# frozen_string_literal: true

class Permit < ApplicationRecord
  has_many :permit_prices, dependent: :restrict_with_error

  enum kind: {
    short: 1,
    long: 2
  }

  def name
    short? ? 'Kurzstrecke' : 'Langstrecke'
  end

  def current_price
    permit_prices.last
  end
end

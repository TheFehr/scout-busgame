# frozen_string_literal: true

class PermitBuy < ApplicationRecord
  belongs_to :group
  belongs_to :permit_price
end

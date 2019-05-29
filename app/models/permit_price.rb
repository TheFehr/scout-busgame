# frozen_string_literal: true

class PermitPrice < ApplicationRecord
  belongs_to :permit
  has_many :permit_buys, dependent: :restrict_with_error
end

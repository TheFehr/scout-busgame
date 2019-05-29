# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :zones, dependent: :restrict_with_error
  has_many :permit_buys, dependent: :restrict_with_error

  validates :name, :phone, presence: true
end

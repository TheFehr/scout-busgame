# frozen_string_literal: true

class Occupation < ApplicationRecord
  belongs_to :position
  belongs_to :group
end

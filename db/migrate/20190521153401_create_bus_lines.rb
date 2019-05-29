# frozen_string_literal: true

class CreateBusLines < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_lines, &:timestamps
  end
end

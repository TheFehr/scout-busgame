# frozen_string_literal: true

class CreateBusStops < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stops do |t|
      t.references :bus_line, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateOccupations < ActiveRecord::Migration[5.2]
  def change
    create_table :occupations do |t|
      t.references :position, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

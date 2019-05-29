# frozen_string_literal: true

class CreateZones < ActiveRecord::Migration[5.2]
  def change
    create_table :zones do |t|
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end

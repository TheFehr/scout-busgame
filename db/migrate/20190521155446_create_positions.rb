# frozen_string_literal: true

class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.references :zone, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :points
      t.boolean :main_position

      t.timestamps
    end

    add_index :positions, :name, unique: true
  end
end

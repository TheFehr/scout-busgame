# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.integer :money, default: 0
      t.string :notes

      t.timestamps
    end
  end
end

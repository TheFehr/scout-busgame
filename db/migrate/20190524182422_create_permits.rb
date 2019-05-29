# frozen_string_literal: true

class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.integer :kind, null: false

      t.timestamps
    end

    add_index :permits, :kind, unique: true
  end
end

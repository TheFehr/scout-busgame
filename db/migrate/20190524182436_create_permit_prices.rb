# frozen_string_literal: true

class CreatePermitPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :permit_prices do |t|
      t.integer :price
      t.references :permit, foreign_key: true

      t.timestamps
    end
  end
end

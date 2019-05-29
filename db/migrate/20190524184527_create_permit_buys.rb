class CreatePermitBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :permit_buys do |t|
      t.references :group, foreign_key: true
      t.references :permit_price, foreign_key: true

      t.boolean :used, null: false, default: false

      t.timestamps
    end
  end
end

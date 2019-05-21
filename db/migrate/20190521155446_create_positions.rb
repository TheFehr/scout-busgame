class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.references :zone, foreign_key: true
      t.integer :points

      t.timestamps
    end

    add_index :positions, :name, :unique => true
  end
end

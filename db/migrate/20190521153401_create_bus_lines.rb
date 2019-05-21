class CreateBusLines < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_lines do |t|

      t.timestamps
    end
  end
end

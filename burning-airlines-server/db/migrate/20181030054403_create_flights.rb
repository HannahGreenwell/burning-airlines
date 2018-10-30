class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.text :flight_number
      t.text :date
      t.text :destination
      t.text :origin
      t.integer :plane_id

      t.timestamps
    end
  end
end

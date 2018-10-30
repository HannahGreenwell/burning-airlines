class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.integer :rows
      t.integer :columns
      t.text :model

      t.timestamps
    end
  end
end

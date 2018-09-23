class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :manufacturer
      t.string :model
      t.integer :top_speed
      t.integer :range
      t.integer :charge_time
      t.integer :price_per_day

      t.timestamps
    end
  end
end
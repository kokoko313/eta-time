class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :driver
      t.string :model
      t.boolean :available

      t.timestamps null: false
    end
  end
end

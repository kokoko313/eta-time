class CreateEta < ActiveRecord::Migration
  def change
    create_table :eta do |t|
      t.float :time

      t.timestamps null: false
    end
  end
end

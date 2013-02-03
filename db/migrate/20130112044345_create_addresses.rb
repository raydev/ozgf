class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building_name
      t.string :street_number
      t.integer :suburb_street_id
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end

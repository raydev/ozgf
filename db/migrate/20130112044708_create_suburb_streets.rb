class CreateSuburbStreets < ActiveRecord::Migration
  def change
    create_table :suburb_streets do |t|
      t.integer :suburb_id
      t.integer :street_id 

      t.timestamps
    end
  end
end

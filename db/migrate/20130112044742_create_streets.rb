class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :name
      t.integer :suburb_id
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end

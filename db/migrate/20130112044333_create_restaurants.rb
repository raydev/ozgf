class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :name_sys_string_id
      t.integer :address_id

      t.timestamps
    end
  end
end

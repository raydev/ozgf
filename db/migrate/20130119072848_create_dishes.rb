class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :dish_type_id
      t.string :name_sys_string_id

      t.timestamps
    end
  end
end

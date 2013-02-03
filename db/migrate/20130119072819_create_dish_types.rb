class CreateDishTypes < ActiveRecord::Migration
  def change
    create_table :dish_types do |t|
      t.string :name_sys_string_id

      t.timestamps
    end
  end
end

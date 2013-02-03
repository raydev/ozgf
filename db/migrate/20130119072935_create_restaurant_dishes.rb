class CreateRestaurantDishes < ActiveRecord::Migration
  def change
    create_table :restaurant_dishes do |t|
      t.integer :restaurant_id
      t.integer :dish_id

      t.timestamps
    end
  end
end

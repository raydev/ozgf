class Dish < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name_sys_string, :dish_type
  belongs_to :dish_type
  belongs_to :name_sys_string, :class_name => "SysString", :foreign_key => "name_sys_string_id"
end
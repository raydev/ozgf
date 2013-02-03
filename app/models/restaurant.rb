class Restaurant < ActiveRecord::Base
  attr_accessible :name_sys_string, :address
  belongs_to :address
  belongs_to :name_sys_string, :class_name => "SysString", :foreign_key => "name_sys_string_id"
  
  has_many :restaurant_dishes
  has_many :dishes, :through => :restaurant_dishes

  #rect comes from Geo.rect_by_size
  scope :in_rect, lambda{|rect| {
  :include => :address, 
  :conditions => ["addresses.lat < ? AND addresses.lng > ? AND addresses.lat > ? AND addresses.lng < ?",
    rect[:lat1] * 1000000, rect[:lng1] * 1000000, rect[:lat2] * 1000000, rect[:lng2] * 1000000]}}
end

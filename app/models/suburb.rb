class Suburb < ActiveRecord::Base
  attr_accessible :name, :postcode
  
  def self.find_or_create(name, postcode)
    @@subs ||= {}
    name = name.titleize
    @@subs[name] = Suburb.first(:conditions => ["LOWER(name) LIKE LOWER(?) AND postcode=?", name, postcode]) ||
      Suburb.create!(:name => name, :postcode => postcode)
  end
end

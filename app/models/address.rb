class Address < ActiveRecord::Base
  attr_accessible :building_name, :street_number, :suburb_street_id,
    :lat, :lng
  
  belongs_to :suburb_street

  validates_presence_of :street_number

  def distance_to(address)
    Geo.instance.distance_between(
      self.lat.to_f / 1000000,
      self.lng.to_f / 1000000,
      address.lat.to_f / 1000000,
      address.lng.to_f / 1000000
    )
  end

  def self.find_or_create(address_info)
   suburb = Suburb.find_or_create(address_info[:suburb_name], address_info[:postcode])
   street = Street.find_or_create(address_info[:street_name], suburb)
   ss = SuburbStreet.first(:conditions => ["suburb_id=? AND street_id=?", suburb.id, street.id])
   Address.first(
     :conditions => ["
       street_number=? AND
       suburb_street_id=?",
     address_info[:street_number],
     ss.id]) || 
     Address.create!(
       :building_name => address_info[:building_name],
       :street_number => address_info[:street_number],
       :suburb_street_id => ss.id,
       :lat => address_info[:lat],
       :lng => address_info[:lng])
  end
end

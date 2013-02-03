class Street < ActiveRecord::Base
  attr_accessible :name, :suburbs
  
  has_many :suburb_streets
  has_many :suburbs, :through => :suburb_streets

  scope :by_suburb, lambda{|suburb| {
    :include => :suburbs,
    :conditions => ["suburbs.id=?", suburb.id]}}
  
  scope :by_name, lambda{|name| {
    :conditions => ["LOWER(streets.name)=LOWER(?)", name]}}

  def self.find_or_create(name, suburb)
    @@streets ||= {}
    name ||= name.titleize
    street = Street.by_suburb(suburb).by_name(name).first
    @@streets["#{name}-#{suburb.id}"] ||= street ||
      Street.create!(
        :name => name,
        :suburbs => [suburb]
      )
  end

end

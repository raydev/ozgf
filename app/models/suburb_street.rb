class SuburbStreet < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :suburb
  belongs_to :street
end

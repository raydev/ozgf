require 'singleton'

class Geo
  include Singleton
  include Math

  def distance_between(lat1, lng1, lat2, lng2)
    lat_diff = (lat1 - lat2)*PI/180.0  
    lng_diff = (lng1 - lng2)*PI/180.0  
    lat_sin = Math.sin(lat_diff/2.0) ** 2  
    lng_sin = Math.sin(lng_diff/2.0) ** 2  
    first = Math.sqrt(lat_sin + Math.cos(lat1*PI/180.0) * Math.cos(lat2*PI/180.0) * lng_sin)  
    result = Math.asin(first) * 2 * 6378137.0 
  end

  # for lat, 0.001 means around 111.32 meters
  # fot lng, 0.001 means arount 98.64 meters
  def rect_by_size(lat, lng, distance)
    {
      :lat1 => (lat + distance.to_f / 111.32),
      :lng1 => (lng - distance.to_f / 98.64),
      :lat2 => (lat - distance.to_f / 111.32),
      :lng2 => (lng + distance.to_f / 98.64)
    }
  end
end

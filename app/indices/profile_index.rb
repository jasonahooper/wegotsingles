ThinkingSphinx::Index.define :profile, :with => :active_record do
  indexes user.type, :as => :sex
  indexes about_you
  indexes likes_and_dislikes
  indexes looking_for
  # has user.lat, user.lng
  # has "RADIANS(user.lat)", :type => :float
  # has "RADIANS(user.lng)", :type => :float
  # has geocoding.geocode(:id), :as => :geocode_id
  # has "RADIANS(user.lat)",  :as => :latitude,  :type => :float
  # has "RADIANS(user.lng)", :as => :longitude, :type => :float
  has "RADIANS(users.lat)",  :as => :lat,  :type => :float
  has "RADIANS(users.lng)", :as => :lng, :type => :float

  # If you're using PostgreSQL:
  # group_by 'latitude', 'longitude'
  group_by 'lat', 'lng'
end
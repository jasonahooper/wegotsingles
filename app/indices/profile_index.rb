ThinkingSphinx::Index.define :profile, :with => :active_record do
  indexes user.type, :as => :sex
  indexes about_you
  has user.lat, user.lng
  # has "RADIANS(user.lat)",  :as => :latitude,  :type => :float
  # has "RADIANS(user.lng)", :as => :longitude, :type => :float
  # group_by 'latitude', 'longitude'
end
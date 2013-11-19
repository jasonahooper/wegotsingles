class Ethnicity < ActiveRecord::Base
  has_many :profile_ethnicities
  has_many :profiles, :through => :profile_ethnicities
end

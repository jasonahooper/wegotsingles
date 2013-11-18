class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities

  accepts_nested_attributes_for :profile_ethnicities, allow_destroy: true
end

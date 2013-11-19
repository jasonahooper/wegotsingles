class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities
  has_many :profile_languages
  has_many :languages, :through => :profile_languages
end

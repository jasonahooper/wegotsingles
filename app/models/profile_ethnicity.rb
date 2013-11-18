class ProfileEthnicity < ActiveRecord::Base
  belongs_to(:profile)

  validates :ethnicity, :presence => true
end

class ProfileEthnicity < ActiveRecord::Base
  belongs_to(:profile)
  belongs_to(:ethnicity)
end
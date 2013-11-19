class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities

  attr_accessor :imperial, :metric_height, :imperial_height

  before_validation do
    if self.imperial == "true"
      self.height = Profile.imperial_to_metric_height_conversion(self.imperial_height)
    else
      self.height = self.metric_height
    end
  end

  def self.metric_to_imperial_height_conversion(height)
    height.centimeter.to_feet.to_f.round(1)
  end

  def self.imperial_to_metric_height_conversion(height)
    height.to_f.feet.to_centimeter.to_i
  end

end

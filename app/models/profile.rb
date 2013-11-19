class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities

  attr_accessor :imperial

  def self.metric_to_imperial_height_conversion(height)
    height.centimeter.to_feet.to_f.round(1)
  end

  def self.imperial_to_metric_height_conversion(height)
    height.to_f.feet.to_centimeter.to_i
  end

  def height=(height)
    if self.imperial
      write_attribute(:height, Profile.imperial_to_metric_height_conversion(height))
    else
      write_attribute(:height, height)
    end
  end

end

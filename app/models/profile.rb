class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessor :imperial

  def self.metric_to_imperial_height_conversion(height)
    imperial = height.centimeter.to_feet.to_f.round(1)
  end

  def self.imperial_to_metric_height_conversion(height)
    metric = height.feet.to_centimeter.to_i
  end

  def height=(height)
    if self.imperial
      write_attribute(:height, Profile.imperial_to_metric_height_conversion(height))
    else
      write_attribute(:height, height)
    end
  end
end

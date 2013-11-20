class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities
  has_many :profile_languages
  has_many :languages, :through => :profile_languages

  attr_accessor :imperial, :imperial_bln_weight, :metric_height, :imperial_height, :imperial_weight, :metric_weight

  before_validation do
    if self.imperial == "true"
      self.height = Profile.imperial_to_metric_height_conversion(self.imperial_height)
    else
      self.height = self.metric_height
    end
  end

    before_validation do
    if self.imperial_bln_weight == "true"
      self.weight = Profile.imperial_to_metric_weight_conversion(self.imperial_weight)
    else
      self.weight = self.metric_weight
    end
  end

  def self.metric_to_imperial_height_conversion(height)
    height.centimeter.to_feet.to_f.round(1)
  end

  def self.imperial_to_metric_height_conversion(height)
    height.to_f.feet.to_centimeter.to_i
  end

  def self.metric_to_imperial_weight_conversion(weight)
    stones = weight.kilogram.to_pounds/14
    stones.to_f.round(1)
  end

  def self.imperial_to_metric_weight_conversion(weight)
    pounds = weight.to_f*14.0
    kilograms = pounds.pounds.to_kilograms
    kilograms.to_i.round(1)
  end

  def imperial_casting_frac(number)
     BigDecimal.new(number, 3).frac
  end

  def imperial_casting_fix(number)
     BigDecimal.new(number, 3).frac
  end

  def imperial_height_show
    h = BigDecimal.new(Profile.metric_to_imperial_height_conversion(self.height), 3)
    feet, inches = h.fix.to_i, (h.frac*10).to_i
    return [feet, inches]
  end

  def imperial_weight_show
    w = BigDecimal.new(Profile.metric_to_imperial_weight_conversion(self.weight), 3)
    stones, pounds = w.fix.to_i, (w.frac*10).to_i
    return [stones, pounds]
  end

  def self.education_options
    ["Secondary School", "College", "Bachelor's Degree", "Master's Degree", "PhD"]
  end
end

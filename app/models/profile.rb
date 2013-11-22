class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities
  has_many :profile_languages
  has_many :languages, :through => :profile_languages
  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true

  attr_accessor :string_education, :imperial, :imperial_bln_weight, :metric_height, :imperial_height, :imperial_weight, :metric_weight

  before_save :calculate_progress

  def calculate_progress
    @number_of_attributes = Profile.progress_attributes.count
    filled_array_values = Profile.progress_attributes.select { |x| self.send(x).blank? == false }
    number_of_filled_values = filled_array_values.count
    percentage = 80.0 / @number_of_attributes 
    total_percentage = number_of_filled_values.to_f * percentage
    @destruction = images.select { |x| x.marked_for_destruction? }
    @keepers = images.length - @destruction.length
    if @keepers > 0 
      total_percentage += 20.0
    end
    self.progress = total_percentage
  end

  def metric_to_imperial_height_conversion(height)
    height.centimeter.to_feet.to_f.round(1)
  end

  def imperial_to_metric_height_conversion(height)
    height.to_f.feet.to_centimeter.to_i
  end

  def metric_to_imperial_weight_conversion(weight)
    stones = weight.kilogram.to_pounds/14
    stones.to_f.round(1)
  end

  def imperial_to_metric_weight_conversion(weight)
    pounds = weight.to_f*14.0
    kilograms = pounds.pounds.to_kilograms
    kilograms.to_i.round(1)
  end

  def imperial_height_show
    h = BigDecimal.new(self.imperial_height, 3)
    feet, inches = h.fix.to_i, (h.frac*10).to_i
    return [feet, inches]
  end

  def imperial_weight_show
    w = BigDecimal.new(self.imperial_weight, 3)
    stones, pounds = w.fix.to_i, (w.frac*10).to_i
    return [stones, pounds]
  end

  def imperial_height=(height)
    if self.imperial == "true"
      write_attribute(:height, imperial_to_metric_height_conversion(height))
    end
    @imperial_height = height
  end

  def imperial_height
    h = read_attribute(:height)
    @imperial_height ||= metric_to_imperial_height_conversion(h) if h
  end

  def metric_height=(height)
    if self.imperial != "true"
     write_attribute(:height, height)
    end
    @metric_height = height
  end

  def metric_height
    read_attribute :height
  end

  def imperial_weight=(weight)
    if self.imperial_bln_weight == "true"
      write_attribute(:weight, imperial_to_metric_weight_conversion(weight))
    end
    @imperial_weight = weight
  end

  def imperial_weight
    w = read_attribute(:weight)
    @imperial_weight ||= metric_to_imperial_weight_conversion(w) if w
  end

  def metric_weight=(weight)
    if self.imperial_bln_weight != "true"
     write_attribute(:weight, weight)
    end
   @metric_weight = weight
  end

  def metric_weight
    read_attribute :weight
  end

  def matches
    self.user.type == "Man" ? seeking = "Woman" : seeking = "Man"
    self.looking_for ? search_term = self.looking_for : search_term = self.about_you
    Profile.search "\"#{search_term}\"/1 @sex #{seeking}"
  end

  def self.progress_attributes
    [:occupation, :smoking_habits, :height, :star_sign, :drink_frequency, :favourite_tipple, :weight, :education, :about_you, :likes_and_dislikes, :looking_for, :religion]
  end

  def self.education_options
    [["Secondary School", 0], ["College", 1], ["Bachelor's Degree", 2], ["Master's Degree", 3], ["PhD", 4]]
  end
end

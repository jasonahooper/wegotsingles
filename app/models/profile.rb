class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities
  has_many :profile_languages
  has_many :languages, :through => :profile_languages
  has_many :images
  belongs_to :main_image, :class_name => 'Image', :foreign_key => 'main_image_id'
  accepts_nested_attributes_for :images, :allow_destroy => true

  attr_accessor :string_education, :imperial, :imperial_bln_weight, :metric_height, :imperial_height, :imperial_weight, :metric_weight

  include Progressable

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

  def matches(options={})
    seeking = self.user.type == "Man" ? "Woman" : "Man"
    search_term = "#{self.looking_for} #{self.likes_and_dislikes} #{self.about_you}".strip
    search_params = { :conditions => { :sex => seeking } }
    search_params = search_params.merge( options )
    Profile.search "\"#{search_term}\"/1", search_params
  end

  def self.education_options
    [["Secondary School", 0], ["College", 1], ["Bachelor's Degree", 2], ["Master's Degree", 3], ["PhD", 4]]
  end
end

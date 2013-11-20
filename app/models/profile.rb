class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_ethnicities
  has_many :ethnicities, :through => :profile_ethnicities
  has_many :profile_languages
  has_many :languages, :through => :profile_languages

  attr_accessor :imperial, :imperial_bln_weight, :metric_height, :imperial_height, :imperial_weight, :metric_weight

  before_validation do
    if self.imperial_bln_weight == "true"
      self.weight = imperial_to_metric_weight_conversion(self.imperial_weight)
    else
      self.weight = self.metric_weight
    end
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
    w = BigDecimal.new(metric_to_imperial_weight_conversion(self.weight), 3)
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

  # def imperial_weight
  #   w = self.weight || @imperial_weight.to_f
  #   imperial_to_metric_weight_conversion(w) if w
  # end

  # def metric_weight
  #   read_attribute :weight
  # end
end

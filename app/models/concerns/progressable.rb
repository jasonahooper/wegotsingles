require 'active_support/concern'

module Progressable
  extend ActiveSupport::Concern

  included do
    before_save :calculate_progress
  end

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

  module ClassMethods
    def progress_attributes
      [:occupation, :smoking_habits, :height, :star_sign, :drink_frequency, :favourite_tipple, :weight, :education, :about_you, :likes_and_dislikes, :looking_for, :religion]
    end
  end
end
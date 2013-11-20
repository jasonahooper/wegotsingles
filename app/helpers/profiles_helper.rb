module ProfilesHelper

  def imperial_height_show(profile)
    h = BigDecimal.new(profile.imperial_height, 3)
    feet, inches = h.fix.to_i, (h.frac*10).to_i
    return [feet, inches]
  end

  def imperial_weight_show(profile)
    w = BigDecimal.new(profile.imperial_weight, 3)
    stones, pounds = w.fix.to_i, (w.frac*10).to_i
    return [stones, pounds]
  end

  def retreive_education(education)
    Profile.education_options.rassoc(education).first
  end

  def star_signs
    ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces']
  end

  def levels_of_interest
    [['Not interested', 1 ], ['Interested', 2 ], ['Very interested', 3 ]]
  end

  def drink_frequencies
    ['never', 'sometimes', 'at weekends', 'often']
  end

  def level_of_interest(integer)
    case integer
    when 1
      "not interested"
    when 2
      "interested"
    when 3
      "very interested"
    end
  end



end

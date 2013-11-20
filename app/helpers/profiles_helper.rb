module ProfilesHelper
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

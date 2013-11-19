module UsersHelper

  def earliest_year_to_join
    Time.now.year - Wegotsingles::Application.config.minimum_age  
  end
  
end

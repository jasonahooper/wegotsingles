module UsersHelper

  def earliest_year_to_join
    Time.now.year - Wegotsingles::Application.config.minimum_age
  end

  def default_image_tag(user, type = 'thumb')
    image_tag "#{user.type.downcase}-#{type}.png", :alt => user.username
  end

end

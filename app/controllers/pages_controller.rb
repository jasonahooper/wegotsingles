class PagesController < ApplicationController

  def home
    @men = Man.order(:created_at => :desc)
    @women = Woman.order(:created_at => :desc)
  end

end

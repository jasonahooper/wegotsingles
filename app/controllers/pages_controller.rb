class PagesController < ApplicationController
  def home
    @men = Man.order(:created_at => :desc).limit(20)
    @women = Woman.order(:created_at => :desc).limit(20)
  end
end

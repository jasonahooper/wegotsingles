class ProfilesController < ApplicationController
  def update
    binding.pry
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to 'show'
    else
      render 'new'
    end
  end
  private
    def profile_params
      params.require(:profile).permit(:ethnicities_attributes => [:ethnicity])
    end
end

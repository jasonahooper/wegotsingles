class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    binding.pry
    if @profile.save
      redirect_to 'show'
    else
      render 'new'
    end
  end
  private
    def profile_params
      params.require(:profile).permit(:profile_ethnicities_attributes => [:ethnicity])
    end
end

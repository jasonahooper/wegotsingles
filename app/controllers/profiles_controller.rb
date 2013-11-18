class ProfilesController < ApplicationController
  def create
    binding.pry
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to 'show'
    else
      render 'new'
    end
  end
  private
    def profile_params
      params.require(:profile).permit(:ethnicity, :profile_ethnicities_attributes)
    end
end

class ProfilesController < ApplicationController
  def update
    p = Profile.find(params[:id])
    if p.update_attributes(profile_params)
      binding.pry
      redirect_to 'show'
    else
      render 'edit'
    end
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
      params.require(:profile).permit(:profile_ethnicities_attributes => [:ethnicity_id, :_destroy, :id])
    end
end

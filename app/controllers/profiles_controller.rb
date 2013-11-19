class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      redirect_to user_profile_path(@profile.user, @profile)
    else
      render 'edit'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    @ethnicities = Ethnicity.select(:id, :ethnicity)
    @user = current_user
    @height_options = (140..230).to_a
  end


  def show
    @profile = Profile.find(params[:id])
  end

  private
    def profile_params
      params.require(:profile).permit(:imperial, :height, :ethnicity_ids => [])
    end
end

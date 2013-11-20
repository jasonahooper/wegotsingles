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
    @height_metric_options = (100..230).to_a
    @height_imperial_options = ((2.0)..(7.2)).step(0.1).to_a.map { |a| a.round(1) }
    @languages = Language.select(:id, :language)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private
    def profile_params
      params.require(:profile).permit(:favourite_tipple, :drink_frequency, :smoking_habits, :star_sign, :star_sign_interest_level,
        :occupation, :imperial, :height, :metric_height, :imperial_height,
        :ethnicity_ids => [], :language_ids => [])
    end
end

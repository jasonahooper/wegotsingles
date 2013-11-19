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
    @weight_metric_options = (30..250).to_a
    @weight_imperial_options = ((2.0)..(25.5)).step(0.1).to_a.map { |a| a.round(1) }
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private
    def profile_params
      params.require(:profile).permit(:occupation, :imperial, :height, :metric_height, :imperial_height, :imperial_bln_weight, :weight, :metric_weight, :imperial_weight, :ethnicity_ids => [])
    end
end

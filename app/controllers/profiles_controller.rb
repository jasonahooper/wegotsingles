class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(profiles_params)
    if @profile.save
      respond_to do |format|
        format.html { render :show }
      end
    end
  end

  private
  def profiles_params
    params.require(:profiles).permit(:imperial, :height)
  end

end

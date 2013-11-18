class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource(:type => params[:user_type])
    respond_with self.resource
  end

  def sign_up_params 
    super.merge(:type => params[:user][:type])
  end

end
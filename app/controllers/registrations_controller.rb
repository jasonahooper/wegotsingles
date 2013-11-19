class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource(:type => params[:user_type])
    respond_with self.resource
  end
end
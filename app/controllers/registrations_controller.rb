class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource(:type => params[:user_type])
    respond_with self.resource
  end

  # def update
  #   account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
  #   @user = User.find(current_user.id)
  #   binding.pry
  #   if @user.update_with_password(account_update_params)
  #     set_flash_message :notice, :updated
  #     # Sign in the user bypassing validation in case his password changed
  #     sign_in @user, :bypass => true
  #     redirect_to after_update_path_for(@user)
  #   else
  #     render "edit"
  #   end
  # end

end
class ApplicationController < ActionController::Base
  #Calls custom devise paramaters santizer (below)
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #Adds our non-standard fields to devise registration sanitizer
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:type, :first_name, :date_of_birth, :username, :seeking]
    # devise_parameter_sanitizer.for(:edit) << [:type, :first_name, :date_of_birth, :username]

    # devise_parameter_sanitizer.for(:sign_up) do |u|
    #   u.permit(:type, :first_name, :date_of_birth, :username)
    # end

    devise_parameter_sanitizer.for(:account_update) << [:"date_of_birth(1i)", :"date_of_birth(2i)", :"date_of_birth(3i)",]
  end
end

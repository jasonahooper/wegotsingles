class ApplicationController < ActionController::Base
  #Calls custom devise paramaters santizer (below)
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #Adds our non-standard fields to devise registration sanitizer
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:type, :first_name]
  end
end

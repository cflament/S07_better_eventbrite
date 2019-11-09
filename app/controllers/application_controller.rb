class ApplicationController < ActionController::Base
  include UsersHelper
  include EventsHelper

  # added to authorize custom fields in devise forms
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # adding the custom fields for registration
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :profile_picture])
  end


  private

  def has_access?
    unless is_administrator?(@event)
      flash[:danger] = "NON"
      redirect_back(fallback_location: root_path)
    end
  end
end

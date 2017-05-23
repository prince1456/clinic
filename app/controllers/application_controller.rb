class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  after_filter :store_action

  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, dashboard_path)
    end
  end
  # def after_sign_in_path_for(resource)
  #   '/profiles/new'
  # end
  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [ :email,:password,:password_confirmation,profile_attributes:  [:id,:first_name, :last_name]])
  end
end

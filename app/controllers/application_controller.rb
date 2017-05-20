class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  after_filter :store_action

  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, dashboard_path)
    end
  end

end

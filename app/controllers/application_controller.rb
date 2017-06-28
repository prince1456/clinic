class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_user
  after_filter :store_action
  before_filter :set_locale

  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, dashboard_path)
    end
  end


  def my_notification(user)
        Notification.where(recipent_id: user).where(action: "message")
  end
  helper_method :my_notification

  layout :layout_by_resource
# in prodution mode if we got error this will execution render method for 404 or 500
  if Rails.env.production?
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end
 end
 # method for render template for 404 page
 def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
  # render method for exception 500 error message
  def render_500(exception)
    logger.info exception.backtrace.join("\n")
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout:      'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end

 private

 def layout_by_resource
   if devise_controller?
     "devise"
   else
     "application"
   end
 end

 def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
 end

 def default_url_options(options = {})
   {locale: I18n.locale}.merge options
 end

  # def after_sign_in_path_for(resource)
  #   '/profiles/new'
  # end
  def user_admin?
    current_user.role == "admin"
  end

  helper_method :user_admin?

  def set_user
    cookies[:username] = current_user || 'guest'
  end
  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [ :email,:password,:password_confirmation,profile_attributes:  [:id,:first_name, :last_name, :lang]])
  end


end

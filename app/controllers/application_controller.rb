class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes



  before_action :not_loggedin, unless: -> { controller_name == "sessions" || controller_name == "users" }

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def not_loggedin
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in."
    end
  end

  def yes_logged_in
    if logged_in?
      redirect_to root_path, alert: "You are already logged in."
    end
  end
end

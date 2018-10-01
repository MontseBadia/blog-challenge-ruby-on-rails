class ApplicationController < ActionController::Base
  before_action :set_locale

  def require_signin
    redirect_to root_path unless current_user
  end

  private
    def current_user
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

    helper_method :current_user
end

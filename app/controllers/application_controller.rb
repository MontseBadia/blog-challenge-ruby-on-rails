class ApplicationController < ActionController::Base
  before_action :set_locale

  def require_signin
    redirect_to root_path unless current_user
  end

  def translator
    translator ||= Yandex::Translator.new('trnsl.1.1.20181001T214308Z.9ac4f9286d6d971f.3fad4172dbddbd6ba9cae7949942d15453ca6621')
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

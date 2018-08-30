class ApplicationController < ActionController::Base

  before_action :set_locale

  protect_from_forgery with: :exception

  def current_church
    @current_church ||= Church.find(1)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end

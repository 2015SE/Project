class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include UsersHelper
  before_action :set_locale

  private

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
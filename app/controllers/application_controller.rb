# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[last_name first_name])
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end

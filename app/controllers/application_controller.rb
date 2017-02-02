class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_locale

  rescue_from Exceptions::BaseException, with: :error

  def current_user
    # Urgh! But it's a temporary site
    return test_current_user if Rails.env.test?
    @current_user ||= find_user(session[:user_email])
  end

  def error(e)
    render "errors/#{e.status}", status: e.status
  end

  private
  def set_locale
    I18n.locale = :fr
  end

  def find_user(email)
    User.find_or_create(email)
  end

  def test_current_user
    @current_user ||= find_user(params[:user_email])
  end
end

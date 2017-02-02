class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from Exceptions::BaseException, with: :error

  def current_user
    # Urgh! But it's a temporary site
    return test_current_user if Rails.env.test?
    @current_user ||= find_user
  end

  def error(e)
    render "errors/#{e.status}", status: e.status
  end

  private
  def find_user
    u = User.find_or_create(session[:user_email])
    u.touch(:last_sign_in_at)
    u
  end
  def test_current_user
    @current_user ||= User.find_or_create(params[:user_email])
  end
end

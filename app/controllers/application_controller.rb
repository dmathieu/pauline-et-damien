class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from Exceptions::BaseException, with: :error

  def current_user
    # Urgh! But it's a temporary site
    return test_current_user if Rails.env.test?
    @current_user ||= User.new(session[:user_email])
  end

  def error(e)
    render "errors/#{e.status}", status: e.status
  end

  private
  def test_current_user
    @current_user ||= User.new(params[:user_email])
  end
end

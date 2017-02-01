class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from Exceptions::BaseException, with: :error

  def current_user
    @current_user ||= User.new(session[:user_email])
  end

  def error(e)
    render "errors/#{e.status}", status: e.status
  end
end

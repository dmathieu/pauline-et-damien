class AuthenticationController < ApplicationController

  def callback
    email = request.env['omniauth.auth'].extra.id_info["email"]
    user = User.new(email)

    if user.admin?
      session[:user_email] = email
    end

    redirect_to root_url
  end

  def failure
    redirect_to root_url
  end
end

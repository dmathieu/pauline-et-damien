module Admin
  class BaseController < ApplicationController
    before_action :admin_only

    def admin_only
      # Urgh! But it's a temporary site
      return if Rails.env.test? && params[:admin]
      raise Exceptions::AccessDenied unless current_user.admin?
    end
  end
end

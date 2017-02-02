module Admin
  class BaseController < ApplicationController
    before_action :admin_only

    def admin_only
      return redirect_to '/auth/google_oauth2' if current_user.guest?
      raise Exceptions::AccessDenied unless current_user.admin?
    end
  end
end

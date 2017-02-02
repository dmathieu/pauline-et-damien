module Admin
  class MainController < BaseController

    def index
      redirect_to '/admin/presents'
    end
  end
end

module Admin
  class PresentsController < BaseController

    def index
      @presents = Present.all
    end

    def new
      @present = Present.new
    end

    def edit
      @present = Present.find(params[:id])
      render 'new'
    end

    def create
      @present = Present.new(present_params)

      if @present.save
        redirect_to admin_presents_url
      else
        render 'new'
      end
    end

    def update
      @present = Present.find(params[:id])

      if @present.update_attributes(present_params)
        redirect_to admin_presents_url
      else
        render 'new'
      end
    end

    def destroy
      @present = Present.find(params[:id])
      @present.destroy
      redirect_to admin_presents_url
    end

    private
    def present_params
      params.require(:present).permit(:title, :description, :price)
    end
  end
end

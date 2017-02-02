class WelcomeController < ApplicationController

  def index; end
  def logements; end
  def venir; end
  def presents
    @presents = Present.all.sort do |a,b|
      if a.remaining != 0 && b.remaining != 0
        a.remaining <=> b.remaining
      else
        b.remaining <=> a.remaining
      end
    end
  end

  def payment
    payment = Payment.new(payment_params)
    payment.save
    redirect_to liste_mariage_path
  end

  private
  def payment_params
    params.require(:payment).permit(:name, :amount, :present_id)
  end
end

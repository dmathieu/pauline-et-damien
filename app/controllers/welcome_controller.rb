class WelcomeController < ApplicationController

  def index
    @skip_container = true 
  end
  def logements; end
  def venir; end
  def rsvp
    @skip_container = true 
  end

  def presents
    @presents = Present.all.includes(:payments).sort do |a,b|
      if a.remaining != 0 && b.remaining != 0
        a.remaining <=> b.remaining
      else
        b.remaining <=> a.remaining
      end
    end
  end

  def payment
    payment = Payment.new(payment_params)
    if payment.save
      flash[:success] = "Nous avons bien enregistré votre cadeau. Merci de votre générosité."
    else
      flash[:danger] = "Une erreur est survenue: #{payment.errors.full_messages.join(', ')}"
    end
    redirect_to liste_mariage_path
  end

  private
  def payment_params
    params.require(:payment).permit(:name, :amount, :present_id)
  end
end

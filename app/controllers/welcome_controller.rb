class WelcomeController < ApplicationController

  def index
    @skip_container = true 
  end
  def logements; end
  def venir; end
  def rsvp
    @skip_container = true 
  end
  def civil
    path = 'app/assets/images/civil/*'

    @images = Dir.glob(path).sort do |a, b|
      File.basename(a, File.extname(a)) <=> File.basename(b, File.extname(b))
    end.map do |i|
      next if i.match(/\.small\./)
      img = i.gsub('app/assets/images/', '')
      small = File.dirname(img)+"/"+File.basename(img, File.extname(img))+".small"+File.extname(img)
      {img: img, small: small}
    end.compact
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

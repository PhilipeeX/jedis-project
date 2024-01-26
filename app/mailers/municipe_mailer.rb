class MunicipeMailer < ApplicationMailer
  def register_successful(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: t('.subject'))
  end

  def data_update_successful(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: t('.subject'))
  end

  def update_status(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: t('.subject'))
  end
end

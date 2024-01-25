class MunicipeMailer < ApplicationMailer
  def register_successful(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Cadastro Realizado')
  end

  def data_update_successful(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Atualização realizada')
  end

  def update_status(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Alteração no seu status.')
  end
end

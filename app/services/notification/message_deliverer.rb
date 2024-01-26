module Notification
  class MessageDeliverer < ServicesApplication
    def initialize(municipe, action)
      @municipe = municipe
      @action = action
    end

    def call
      case @action
      when :create
        send_create_notification
      when :update
        send_update_notification
      when :toggle_status
        send_status_notification
      else
        raise ArgumentError, "Ação desconhecida: #{@action}"
      end
    end

    private

    def send_create_notification
      MunicipeMailer.register_successful(@municipe).deliver_later
      # TwilioClient.new.send_text(@municipe, 'Cadastro realizado com sucesso!')
    end

    def send_update_notification
      MunicipeMailer.data_update_successful(@municipe).deliver_later
      # Notification::TwilioClient.new.send_text(@municipe, 'Seus dados foram atualizados em nosso sistema!')
    end

    def send_status_notification
      MunicipeMailer.update_status(@municipe).deliver_later
      # Notification::TwilioClient.new.send_text(@municipe, 'Seu status foi alterado em nosso sistema!')
    end
  end
end

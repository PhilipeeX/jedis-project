require 'rubygems'
require 'twilio-ruby'
class TwilioClient
  attr_reader

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(municipe, message)
    @client.messages.create(
      from: twilio_phone,
      to: "+55#{municipe.phone_number}",
      body: message
    )
  end

  private

  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def twilio_phone
    Rails.application.credentials.twilio[:twilio_phone]
  end
end

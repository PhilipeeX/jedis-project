require 'rails_helper'

describe Notification::TwilioClient do
  let(:twilio_client) { Notification::TwilioClient.new }

  describe '#send_text' do
    xit 'sends a text message to a valid phone number' do
      municipe = create(:municipe, phone_number: FFaker::PhoneNumberBR.international_mobile_phone_number)
      account_sid = Rails.application.credentials.twilio[:account_sid]
      auth_token = Rails.application.credentials.twilio[:auth_token]
      twilio_phone = Rails.application.credentials.twilio[:twilio_phone]

      allow(twilio_client).to receive(:account_sid).and_return(account_sid)
      allow(twilio_client).to receive(:auth_token).and_return(auth_token)
      allow(twilio_client).to receive(:twilio_phone).and_return(twilio_phone)

      twilio_rest_client = instance_double(Twilio::REST::Client)
      allow(Twilio::REST::Client).to receive(:new).and_return(twilio_rest_client)

      expect(twilio_rest_client).to receive(:messages).and_return(twilio_rest_client)

      expect(twilio_rest_client).to receive(:create).with(hash_including(to: municipe.phone_number))

      twilio_client.send_text(municipe, 'Test message')
    end
  end
end

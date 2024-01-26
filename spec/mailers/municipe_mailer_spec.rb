require 'rails_helper'

RSpec.describe MunicipeMailer, type: :mailer do
  let(:municipe) { create(:municipe) }

  describe '#register_successful' do
    it 'sends a successful registration email' do
      email = MunicipeMailer.register_successful(municipe)
      expect(email.subject).to eq(I18n.t('municipe_mailer.register_successful.subject'))
      expect(email.to).to eq([municipe.email])
    end
  end

  describe '#data_update_successful' do
    it 'sends a successful data update email' do
      email = MunicipeMailer.data_update_successful(municipe)
      expect(email.subject).to eq(I18n.t('municipe_mailer.data_update_successful.subject'))
      expect(email.to).to eq([municipe.email])
    end
  end

  describe '#update_status' do
    it 'sends an update status email' do
      email = MunicipeMailer.update_status(municipe)
      expect(email.subject).to eq(I18n.t('municipe_mailer.update_status.subject'))
      expect(email.to).to eq([municipe.email])
    end
  end
end

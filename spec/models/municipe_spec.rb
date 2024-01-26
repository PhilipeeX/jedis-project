require 'rails_helper'

RSpec.describe Municipe, type: :model do
  it { should define_enum_for(:status).with_values(active: 0, inactive: 1) }

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:photo) }
  end

  it 'is valid with a valid phone number' do
    municipe = build(:municipe, phone_number: '22934120844')

    expect(municipe).to be_valid
  end

  it 'is invalid with an invalid phone number' do
    municipe = build(:municipe, phone_number: '1111111')

    expect(municipe).not_to be_valid
    expect(municipe.errors[:phone_number]).to include(I18n.t('errors.messages.invalid'))
  end

  describe 'attachments' do
    it { should have_one_attached(:photo) }
  end
end

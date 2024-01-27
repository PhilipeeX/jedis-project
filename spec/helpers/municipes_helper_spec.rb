require 'rails_helper'

RSpec.describe MunicipesHelper, type: :helper do
  describe '#phone_formatter' do
    it 'formats a 11-digit phone number' do
      expect(helper.phone_formatter('62989087664')).to eq('(62) 98908-7664')
    end

    it 'formats a phone number with hyphen' do
      expect(helper.phone_formatter('4598196-5746')).to eq('(45) 98196-5746')
    end

    it 'formats a phone number with multiple hyphens' do
      expect(helper.phone_formatter('3493990-5768')).to eq('(34) 93990-5768')
    end
  end

  describe '#error_class' do
    let(:municipe) { double('Municipe', errors: errors) }
    let(:errors) { double('Errors', include?: include_error) }
    let(:include_error) { false }

    it 'returns "border-red-500" when error is present' do
      allow(errors).to receive(:include?).with(:some_attribute).and_return(true)
      expect(helper.error_class(municipe, :some_attribute)).to eq('border-red-500')
    end

    it 'returns "border" when error is not present' do
      expect(helper.error_class(municipe, :some_attribute)).to eq('border')
    end
  end

  describe '#error_message' do
    let(:municipe) { double('Municipe', errors: errors) }
    let(:errors) { double('Errors', include?: include_error, full_messages_for: ['Some error']) }
    let(:include_error) { true }

    it 'returns error message when error is present' do
      expect(helper.error_message(municipe, :some_attribute)).to eq('<div class="text-red-500 text-sm">Some error</div>')
    end

    it 'returns nil when error is not present' do
      allow(errors).to receive(:include?).with(:some_attribute).and_return(false)
      expect(helper.error_message(municipe, :some_attribute)).to be_nil
    end
  end
end

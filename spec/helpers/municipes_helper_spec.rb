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
end

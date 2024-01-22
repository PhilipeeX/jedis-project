require 'rails_helper'

class CnsValidatable
  include ActiveModel::Model
  attr_accessor :cns

  validates :cns, cns: true
end

RSpec.describe CnsValidator do
  subject(:validator) { described_class.new(attributes: [:cns]) }
  let(:model) { CnsValidatable.new }

  context 'when CNS is valid' do
    it 'is valid' do
      model.cns = '170145603800018'
      expect(model).to be_valid
    end
  end

  context 'when CNS is provisional valid' do
    it 'is valid' do
      model.cns = '170145603800018'
      expect(model).to be_valid
    end
  end

  context 'when CNS is invalid' do
    it 'is not valid' do
      model.cns = '123456789012346'
      expect(model).not_to be_valid
    end
  end

  context 'when CNS is provisional invalid' do
    it 'is not valid' do
      model.cns = '372837490874188'
      expect(model).not_to be_valid
    end
  end
end

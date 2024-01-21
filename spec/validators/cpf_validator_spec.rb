require 'rails_helper'

class Validatable
  include ActiveModel::Model
  attr_accessor :cpf

  validates :cpf, cpf: true
end

RSpec.describe CpfValidator, as: :validator do
  subject(:validator) { described_class.new(attributes: [:cpf]) }

  let(:model) { Validatable.new }

  context 'when CPF is valid' do
    it 'is valid' do
      model.cpf = '441.778.037-40'
      expect(model).to be_valid
    end
  end

  context 'when CPF is invalid' do
    it 'is not valid' do
      model.cpf = '123.456.789-01'
      expect(model).not_to be_valid
    end
  end
end

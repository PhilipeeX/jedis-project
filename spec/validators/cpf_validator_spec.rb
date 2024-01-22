require 'rails_helper'

class CpfValidatable
  include ActiveModel::Model
  attr_accessor :cpf

  validates :cpf, cpf: true
end

RSpec.describe CpfValidator do
  subject(:validator) { described_class.new(attributes: [:cpf]) }

  let(:model) { CpfValidatable.new }

  context 'when CPF is valid' do
    valid_cpfs = %w[441.778.037-40 501.693.187-96]

    valid_cpfs.each do |cpf|
      it "is valid for CPF: #{cpf}" do
        model.cpf = cpf
        expect(model).to be_valid
      end
    end
  end

  context 'when CPF is invalid' do
    invalid_cpfs = %w[123.456.789-01 502.693.187-96]

    invalid_cpfs.each do |cpf|
      it "is not valid for CPF: #{cpf}" do
        model.cpf = cpf
        expect(model).not_to be_valid
      end
    end
  end
end

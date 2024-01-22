require 'rails_helper'

class BirthDateValidatable
  include ActiveModel::Model
  attr_accessor :birth_date

  validates :birth_date, birth_date: true
end

RSpec.describe BirthDateValidator do
  subject(:validator) { described_class.new(attributes: [:birth_date]) }

  let(:model) { BirthDateValidatable.new }

  context 'when birth date is valid' do
    valid_birth_dates = [Date.new(1990, 1, 1), Date.new(1985, 5, 10)]

    valid_birth_dates.each do |birth_date|
      it "is valid for birth date: #{birth_date}" do
        model.birth_date = birth_date
        expect(model).to be_valid
      end
    end
  end

  context 'when birth date is invalid' do
    invalid_birth_dates = [Date.current + 1.day, Date.new(1900, 1, 1)]

    invalid_birth_dates.each do |birth_date|
      it "is not valid for birth date: #{birth_date}" do
        model.birth_date = birth_date
        expect(model).not_to be_valid
      end
    end
  end
end

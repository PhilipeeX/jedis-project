class BirthDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if birth_date_valid?(value)

    record.errors.add(attribute, options[:message] || :invalid_birth_date)
  end

  private

  def birth_date_valid?(birth_date)
    return false if birth_date > Date.current || Date.current.year - birth_date.year > 116

    true
  end
end

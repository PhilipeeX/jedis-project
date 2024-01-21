class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if cpf_valid?(value)

    record.errors.add(attribute, options[:message] || :invalid_cpf)
  end

  private

  def cpf_valid?(cpf)
    digits = cpf.scan(/[0-9]/).map(&:to_i)

    return false unless digits.length == 11

    result1 = calculate_digit(digits, 9)
    result2 = calculate_digit(digits, 10)

    result1 == digits[9] && result2 == digits[10]
  end

  def calculate_digit(digits, position)
    sum = digits.take(position).reverse_each.with_index(2).sum { |digit, i| digit * i }
    sum -= (11 * (sum / 11))
    [0, 1].include?(sum) ? 0 : 11 - sum
  end
end

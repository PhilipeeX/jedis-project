class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless cpf_valid?(value)
      record.errors.add(attribute, options[:message] || :invalid_cpf)
    end
  end

  private

  def cpf_valid?(cpf)
    return false if cpf.nil?

    invalid_cpfs = %w[12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000 12345678909]
    digits = cpf.scan(/[0-9]/)
    if digits.length == 11
      unless invalid_cpfs.member?(digits.join)
        digits = digits.collect(&:to_i)
        sum = 10*digits[0]+9*digits[1]+8*digits[2]+7*digits[3]+6*digits[4]+5*digits[5]+4*digits[6]+3*digits[7]+2*digits[8]
        sum = sum - (11 * (sum/11))
        result1 = (sum == 0 or sum == 1) ? 0 : 11 - sum
        if result1 == digits[9]
          sum = digits[0]*11+digits[1]*10+digits[2]*9+digits[3]*8+digits[4]*7+digits[5]*6+digits[6]*5+digits[7]*4+digits[8]*3+digits[9]*2
          sum = sum - (11 * (sum/11))
          result2 = (sum == 0 or sum == 1) ? 0 : 11 - sum
          return true if result2 == digits[10]
        end
      end
    end

    false
  end
end

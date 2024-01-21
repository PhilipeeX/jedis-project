class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if cns_valid?(value) || prov_cns_valid?(value)

    record.errors.add(attribute, options[:message] || :invalid_cns)
  end

  private

  def cns_valid?(cns)
    return false unless cns && cns.strip.length == 15

    pis = cns[0, 11]
    sum = calculate_sum(pis)

    dv = calculate_dv(sum)

    result = if dv == 10
               calculate_result(pis, 2)
             else
               "#{pis}000#{dv.to_i}"
             end

    cns == result
  end

  def calculate_sum(pis)
    sum = 0
    pis.each_char.with_index do |digit, index|
      weight = 15 - index
      sum += digit.to_i * weight
    end
    sum
  end

  def calculate_dv(sum)
    rest = sum % 11
    dv = 11 - rest
    dv.zero? ? 0 : dv
  end

  def calculate_result(pis, extra_sum)
    sum = calculate_sum(pis)
    sum += extra_sum
    rest = sum % 11
    dv = 11 - rest
    "#{pis}001#{dv.to_i}"
  end

  def prov_cns_valid?(cns)
    return false if cns.nil? || cns.strip.length != 15

    sum = 0

    cns.each_char.with_index do |digit, index|
      weight = 15 - index
      sum += digit.to_i * weight
    end

    rest = sum % 11

    rest.zero?
  end
end

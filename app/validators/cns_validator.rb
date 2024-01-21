class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if cns_valid?(value) || prov_cns_valid?(value)

    record.errors.add(attribute, options[:message] || :invalid_cns)
  end

  private

  def cns_valid?(cns)
    return false if cns.nil? || cns.strip.length != 15

    sum = 0
    pis = cns[0, 11]
    result = ''

    pis.each_char.with_index do |digit, index|
      weight = 15 - index
      sum += digit.to_i * weight
    end

    rest = sum % 11
    dv = 11 - rest

    dv = 0 if dv == 11

    if dv == 10
      sum = 0

      pis.each_char.with_index do |digit, index|
        weight = 15 - index
        sum += digit.to_i * weight
      end

      sum += 2
      rest = sum % 11
      dv = 11 - rest
      result = "#{pis}001#{dv.to_i}"
    else
      result = "#{pis}000#{dv.to_i}"
    end

    cns == result
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

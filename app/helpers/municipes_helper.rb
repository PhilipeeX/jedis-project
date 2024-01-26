module MunicipesHelper
  def phone_formatter(phone_number)
    cleaned_number = phone_number.gsub(/\D/, '')
    "(#{cleaned_number[0..1]}) #{cleaned_number[2..6]}-#{cleaned_number[7..10]}"
  end
end

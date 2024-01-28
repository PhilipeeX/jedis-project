module MunicipesHelper
  def phone_formatter(phone_number)
    cleaned_number = phone_number.gsub(/\D/, '')
    "(#{cleaned_number[0..1]}) #{cleaned_number[2..6]}-#{cleaned_number[7..10]}"
  end

  def error_class(municipe, attribute)
    municipe.errors.include?(attribute) ? 'border-red-500' : 'border'
  end

  def error_message(municipe, attribute)
    return unless municipe.errors.include?(attribute)

    content_tag(:div, municipe.errors.full_messages_for(attribute).join(', '), class: 'text-red-500 text-sm')
  end
end

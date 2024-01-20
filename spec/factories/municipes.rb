FactoryBot.define do
  factory :municipe do
    full_name { FFaker::NameBR.name }
    cpf { FFaker::IdentificationBR.cpf }
    cns { %w[228538870180008 121770956210018 865829129710004].sample }
    email { FFaker::Internet.free_email }
    birth_date { FFaker::Date.birthday }
    phone_number { FFaker::PhoneNumberBR.international_mobile_phone_number }

    before(:create) do |municipe|
      random_image_file = Dir.glob(Rails.root.join('spec/fixtures/images/profiles/*.jpg').to_s).sample
      municipe.photo.attach(io: File.open(random_image_file), filename: 'profile.jpg')
    end
    status { rand(0..1) }
  end
end

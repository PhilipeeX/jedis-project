FactoryBot.define do
  factory :municipe do
    full_name { FFaker::NameBR.name }
    cpf { FFaker::IdentificationBR.cpf }
    cns { %w[228538870180008 121770956210018 865829129710004].sample }
    email { FFaker::Internet.free_email }
    birth_date { FFaker::Date.birthday }
    phone_number { FFaker::PhoneNumberBR.phone_number }

    photo do
      random_image_file = Dir.glob(Rails.root.join('spec/fixtures/images/profiles/*.jpg').to_s).sample
      Rack::Test::UploadedFile.new(random_image_file, 'image/jpeg')
    end
    status { %i[active inactive].sample }

    address_attributes do
      {
        cep: '25958-730',
        street: FFaker::AddressBR.street_name,
        complement: FFaker::AddressBR.secondary_address,
        neighborhood: FFaker::AddressBR.neighborhood,
        city: FFaker::AddressBR.city,
        state: FFaker::AddressBR.state_abbr,
        ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample
      }
    end
  end
end

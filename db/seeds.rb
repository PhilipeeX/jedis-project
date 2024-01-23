if Rails.env.development?
  # Creates municipes
  Municipe.create!(full_name: FFaker::NameBR.name,
                                      cpf: FFaker::IdentificationBR.cpf,
                                      cns: '274892941220002',
                                      email: 'dev.philipe@outlook.com',
                                      email_confirmation: 'dev.philipe@outlook.com',
                                      birth_date: Date.strptime('23/11/1988', '%d/%m/%Y'),
                                      phone_number: FFaker::PhoneNumberBR.international_mobile_phone_number,
                                      status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-masculino-1.jpg').to_s), filename: 'foto-homem-1.jpg')
    municipe.build_address(cep: FFaker::AddressBR.zip_code,
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
  Municipe.create!(full_name: FFaker::NameBR.name,
                                      cpf: FFaker::IdentificationBR.cpf,
                                      cns: '165570383740009',
                                      email: 'email_exemplo@outlook.com',
                                      email_confirmation: 'email_exemplo@outlook.com',
                                      birth_date: Date.strptime('09/01/1992', '%d/%m/%Y'),
                                      phone_number: FFaker::PhoneNumberBR.international_mobile_phone_number,
                                      status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-feminino-1.jpg').to_s), filename: 'foto-mulher-1.jpg')
    municipe.build_address(cep: FFaker::AddressBR.zip_code,
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
end
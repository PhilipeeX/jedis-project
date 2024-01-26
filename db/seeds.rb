if Rails.env.development?
  # Creates municipes
  Municipe.create!(full_name: FFaker::NameBR.first_name_male + " " + FFaker::NameBR.last_name,
                   cpf: FFaker::IdentificationBR.cpf,
                   cns: '274892941220002',
                   email: 'dev.philipe@outlook.com',
                   birth_date: Date.strptime('23/11/1988', '%d/%m/%Y'),
                   phone_number: FFaker::PhoneNumberBR.phone_number,
                   status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-masculino-1.jpg').to_s), filename: 'foto-homem-1.jpg')
    municipe.build_address(cep: '21515-537',
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
  # Municipe 2
  Municipe.create!(full_name: FFaker::NameBR.first_name_female + " " + FFaker::NameBR.last_name,
                   cpf: FFaker::IdentificationBR.cpf,
                   cns: '165570383740009',
                   email: 'email_exemplo@outlook.com',
                   birth_date: Date.strptime('09/01/1992', '%d/%m/%Y'),
                   phone_number: FFaker::PhoneNumberBR.phone_number,
                   status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-feminino-1.jpg').to_s), filename: 'foto-mulher-1.jpg')
    municipe.build_address(cep: '21515-537',
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
  # Municipe 3
  Municipe.create!(full_name: FFaker::NameBR.first_name_female + " " + FFaker::NameBR.last_name,
                   cpf: FFaker::IdentificationBR.cpf,
                   cns: '143260138860007',
                   email: 'email3@outlook.com',
                   birth_date: Date.strptime('03/07/1995', '%d/%m/%Y'),
                   phone_number: FFaker::PhoneNumberBR.phone_number,
                   status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-feminino-2.jpg').to_s), filename: 'foto-mulher-1.jpg')
    municipe.build_address(cep: '21515-537',
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
  # Municipe 4
  Municipe.create!(full_name: FFaker::NameBR.first_name_female + " " + FFaker::NameBR.last_name,
                   cpf: FFaker::IdentificationBR.cpf,
                   cns: '140008488340007',
                   email: 'email_aleatorio@outlook.com',
                   birth_date: Date.strptime('23/01/1990', '%d/%m/%Y'),
                   phone_number: FFaker::PhoneNumberBR.phone_number,
                   status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-feminino-3.jpg').to_s), filename: 'foto-mulher-1.jpg')
    municipe.build_address(cep: '25080-226',
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
  # Municipe 5
  Municipe.create!(full_name: FFaker::NameBR.first_name_male + " " + FFaker::NameBR.last_name,
                   cpf: FFaker::IdentificationBR.cpf,
                   cns: '713128265740005',
                   email: 'email_aleatorio2@outlook.com',
                   birth_date: Date.strptime('03/09/1996', '%d/%m/%Y'),
                   phone_number: FFaker::PhoneNumberBR.phone_number,
                   status: rand(0..1)) do |municipe|
    municipe.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-masculino-2.jpg').to_s), filename: 'foto-mulher-1.jpg')
    municipe.build_address(cep: '26510-343',
                           street: FFaker::AddressBR.street_name,
                           complement: FFaker::AddressBR.secondary_address,
                           neighborhood: FFaker::AddressBR.neighborhood,
                           city: FFaker::AddressBR.city,
                           state: FFaker::AddressBR.state_abbr,
                           ibge_code: %w[2914703 3161403 1101005 3504206 3537156].sample)
  end
end

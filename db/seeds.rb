if Rails.env.development?
  # Creates municipes
  municipe_marcelo = Municipe.create!(full_name: 'Marcelo Sangali da Silva',
                                      cpf: '032.063.460-45',
                                      cns: '274892941220002',
                                      email: 'giovanni_rj@outlook.com',
                                      birth_date: Date.strptime('23/11/1988', '%d/%m/%Y'),
                                      phone_number: '5521929597661',
                                      status: rand(0..1))
  municipe_bianca = Municipe.create!(full_name: 'Victoria Roscher',
                                      cpf: '159.418.450-06',
                                      cns: '165570383740009',
                                      email: 'Victoria_ux@gmail.com',
                                      birth_date: Date.strptime('09/01/1992', '%d/%m/%Y'),
                                      phone_number: '5546989151067',
                                      status: rand(0..1))

  # Attaches photo to municipes
  municipe_marcelo.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-masculino-1.jpg').to_s), filename: 'foto-homem-1.jpg')
  municipe_bianca.photo.attach(io: File.open(Rails.root.join('spec/fixtures/images/profiles/perfil-feminino-1.jpg').to_s), filename: 'foto-mulher-1.jpg')

end

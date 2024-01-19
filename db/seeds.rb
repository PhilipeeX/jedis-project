if Rails.env.development?
  Municipe.create(full_name: 'Marcelo Sangali da Silva',
                  cpf: '032.063.460-45',
                  cns: '274892941220002',
                  email: 'giovanni_rj@outlook.com',
                  birth_date: Date.strptime('23/11/1988', '%d/%m/%Y'),
                  phone_number: '552129597661',
                  status: rand(0..1))
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

name = 'Admin'
email = 'admin@sei.co'
password = 'admin123'

administrator = Administrator.find_by(email: email)

n_vacancies = 30 # Número desejado de registros

# Creating one administrator

unless administrator
  administrator = Administrator.create!(
    email: email,
    password: password,
    password_confirmation: password
  )

  puts "#1 - Usuário ##{administrator.id} criado com sucesso!"
end

# Creating one parking

parking = Parking.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    opening_time: Time.zone.parse('06:00'),
    closing_time: Time.zone.parse('18:00'),
    administrator_id: administrator.id
)

puts "#2 - Estacionamento criado com sucesso!"

# Creating n vacancies

kinds = Vacancy.kinds.keys # Array com os valores possíveis para o enum kind

n_vacancies.times do
  code = Faker::Alphanumeric.unique.alphanumeric(number: 6) # Gera um código alfanumérico único com 6 caracteres
  kind = kinds.sample # Seleciona um valor aleatório do enum kind

  Vacancy.create!(
    code: code, 
    kind: kind,
    parking_id: parking.id
  )
end

puts "#3 - Vagas criadas com sucesso!"

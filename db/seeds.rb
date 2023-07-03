require 'colorize'
require 'faker'

def create_administrators
  email = 'admin@sei.co'
  password = 'admin123'
   
  administrator = Administrator.create!(
    name: Faker::Name.first_name,
    email: email,
    password: password
  )
  
  puts "#1 - Administrador #{administrator.name} criado com sucesso!".green
end

def create_parkings
  min_cost_per_hour = 0.0
  max_cost_per_hour = 6.0

  administrator = Administrator.last

  if administrator
    puts "#2 - Usando o último administrador cadastrado.".yellow

    Parking.create!(
      name: Faker::Company.name,
      address: Faker::Address.full_address,
      opening_time: Time.zone.parse('06:00'),
      closing_time: Time.zone.parse('18:00'),
      cost_per_hour: rand(min_cost_per_hour..max_cost_per_hour),
      administrator_id: administrator.id
    )

    puts "#2 - Estacionamento criado com sucesso!".green
    return
  end

  puts "#2 - Não foi possível criar estacionamento, pois não foi encontrado um administrador.".red
end

def create_vacancies
  n_vacancies = 18
  
  kinds = Vacancy.kinds.keys
  
  parking = Parking.last

  if parking
    puts "#3 - Usando o último estacionamento cadastrado.".yellow
    
    n_vacancies.times do
      code = Faker::Alphanumeric.unique.alphanumeric(number: 6)
      kind = kinds.sample

      Vacancy.create!(
        code: code, 
        kind: kind,
        parking_id: parking.id
      )
    end
  
    puts "#3 - Vagas criadas com sucesso!".green
    return
  end

  puts "#3 - Não foi possível criar vagas, pois não foi encontrado um estacionamento.".red
end

def run_all
  create_administrators
  create_parkings
  create_vacancies
end

case ENV['SEEDS_SECTION']
when 'administrators'
  create_administrators
when 'parkings'
  create_parkings
when 'vacancies'
  create_vacancies
else
  run_all
end
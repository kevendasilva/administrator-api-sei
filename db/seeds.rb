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

def create_movements
  clients = Client.all

  n_movements = 12

  unless clients.empty?
    puts "#2 - Usando todos os clientes cadastrados.".yellow

    clients.each do |client|
      n_movements.times do
        vehicle = client.vehicles.sample

        unless vehicle
          puts "#2 - Não foi possível criar movimentações, pois não foram encontrados veículo para #{client.name}.".red
          next
        end

        entry_date = Faker::Time.between(from: 1.year.ago, to: Time.current)
        exit_date = Faker::Time.between(from: entry_date, to: Time.current)

        client.movements.create!(
          cost: Faker::Number.decimal(l_digits: 2),
          vehicle: vehicle,
          entry: entry_date,
          exit: exit_date
        )
      end
    end

    puts "#2 - Movimentações criadas com sucesso!".green
    return
  end

  puts "#2 - Não foi possível criar movimentações, pois não foram encontrados clientes.".red
end

def create_parkings
  min_cost_per_hour = 0.0
  max_cost_per_hour = 6.0

  administrator = Administrator.last

  if administrator
    puts "#3 - Usando o último administrador cadastrado.".yellow

    Parking.create!(
      name: Faker::Company.name,
      address: Faker::Address.full_address,
      opening_time: Time.zone.parse('06:00'),
      closing_time: Time.zone.parse('18:00'),
      cost_per_hour: rand(min_cost_per_hour..max_cost_per_hour),
      administrator: administrator
    )

    puts "#3 - Estacionamento criado com sucesso!".green
    return
  end

  puts "#3 - Não foi possível criar estacionamento, pois não foi encontrado um administrador.".red
end

def create_vacancies
  n_vacancies = 18
  
  kinds = Vacancy.kinds.keys
  
  parking = Parking.last

  if parking
    puts "#4 - Usando o último estacionamento cadastrado.".yellow
    
    n_vacancies.times do
      code = Faker::Alphanumeric.unique.alphanumeric(number: 6)
      kind = kinds.sample

      Vacancy.create!(
        code: code, 
        kind: kind,
        parking: parking
      )
    end
  
    puts "#4 - Vagas criadas com sucesso!".green
    return
  end

  puts "#4 - Não foi possível criar vagas, pois não foi encontrado um estacionamento.".red
end

def run_all
  create_administrators
  create_movements
  create_parkings
  create_vacancies
end

case ENV['SEEDS_SECTION']
when 'administrators'
  create_administrators
when 'movements'
  create_movements
when 'parkings'
  create_parkings
when 'vacancies'
  create_vacancies
else
  run_all
end

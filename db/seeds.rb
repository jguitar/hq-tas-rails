# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def generate_last_name
  rand(100) > 80 ? Faker::Name.last_name : "#{Faker::Name.last_name} #{Faker::Name.last_name}"
end

def create_business_units
  business_units = {
    "051": "DSI SI Sopra",
    "052": "DSI Infraestructura",
    "054": "DSI SI Steria",
    "341": "CS Espagne",
    "824": "Maintenance Spain",
    "900": "DG-Juridico-Logistica",
    "901": "Direccion Industrializacion",
    "905": "DRH",
    "906": "MKT-COM",
    "907": "DAF",
    "910": "Centre de Compétences SAB - BI",
    "911": "Gestion de Infraestructuras",
    "912": "Seguros",
    "930": "Banca Estructura",
    "933": "Banca 1",
    "934": "Banca 2",
    "935": "Banca 3",
    "936": "Banca Consulting",
    "943": "Telco-Energía-Transporte",
    "944": "Aeroline",
    "945": "Administración Pública",
    "946": "Retail",
    "947": "Estructura AAPP",
    "951": "Cataluña IS",
    "952": "Cataluña Consulting",
    "961": "Norte",
    "962": "Levante",
    "963": "Sur",
    "964": "Estructura Territorios",
    "970": "Otros Negocios"
  }

  business_units.each do |key, value|
    BusinessUnit.create!(code: key, name: value)
  end
end

def clean_database
  Contributor.delete_all
  BusinessUnit.delete_all

  Workplace.delete_all
  Workroom.delete_all
  Floor.delete_all
  Building.delete_all
  Site.delete_all
end

starting_code = (rand(9) * 10_000) + (rand(9) * 1_000) + (rand(9) * 100) + (rand(9) * 10) + rand(9)

puts "Seeding..."
clean_database
create_business_units
2.times do |i|
  city = Faker::GameOfThrones.city
  letter = ('A'..'Z').to_a[i]

  business_units = BusinessUnit.all
  site = Site.create!(code: city.parameterize, name: city)
  rand(1..2).times do
    building = Building.create!(code: "#{site.code}#{letter}".upcase, name: "#{city} #{letter}", site: site)

    max_floor = rand(1..10)
    floors = (1..max_floor).to_a.sample(rand(max_floor)).sort
    floors.each do |floor|
      floor = Floor.create!(code: "#{building.code}#{floor}", name: "#{floor}a planta", building: building)

      rand(1..10).times do |workroom_id|
        new_workroom = Workroom.create!(code: "#{floor.code}#{workroom_id}", name: "DSC#{workroom_id}", floor: floor)

        rand(5..30).times do |index|
          code = starting_code + index
          occupation_probability = rand(100)

          if occupation_probability > 95
            workroom = nil
            workplace = nil
          elsif occupation_probability > 90
            workplace = nil
            workroom = new_workroom
          else
            workroom = new_workroom
            workplace_number = 500 + index
            workplace = Workplace.create!(code: "#{workroom.code}#{index}", name: "Puesto #{workplace_number}", workroom: workroom)
          end

          business_unit = business_units.sample
          Contributor.create!(code: code, last_name: generate_last_name, first_name: Faker::Name.first_name, business_unit: business_unit, workplace: workplace, workroom: workroom, site: site)
        end
      end
    end
  end
end


puts('Done')

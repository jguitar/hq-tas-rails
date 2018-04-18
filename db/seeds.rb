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

starting_code = (rand(9) * 10_000) + (rand(9) * 1_000) + (rand(9) * 100) + (rand(9) * 10) + rand(9)

2.times do |i|
  city = Faker::GameOfThrones.city

  business_unit = BusinessUnit.create!(code: "#{i}912", name: "NEGOCIO #{i}")
  site = Site.create!(code: city.parameterize, name: city)
  building = Building.create!(code: "#{site.code}A", name: "#{city} A", site: site)

  floors = [2, 3, 5, 8, 9]
  floors.each do |floor|
    floor = Floor.create!(code: "#{building.code}#{floor}", name: "#{floor}a planta", building: building)

    rand(10).times do |workroom_id|
      workroom = Workroom.create!(code: "#{floor.code}#{workroom_id}", name: "DSC#{workroom_id}", floor: floor)

      rand(10..50).times do |index|
        code = starting_code + index
        workplace_number = 500 + index
        workplace = Workplace.create!(code: "#{workroom.code}#{index}", name: "Puesto #{workplace_number}", workroom: workroom)
        Contributor.create!(code: code, last_name: generate_last_name, first_name: Faker::Name.first_name, business_unit: business_unit, workplace: workplace, workroom: workroom, site: site)
      end
    end
  end
end


puts('ok')

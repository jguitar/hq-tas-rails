# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def generate_next(index, code, site:, business_unit:, last_name:, first_name:, workroom:, city:)
  workplace_number = 500 + index
  workplace = Workplace.create!(code: "#{city.parameterize}-#{workplace_number}", name: "Puesto #{workplace_number}", workroom: workroom)
  Contributor.create!(code: code, last_name: last_name, first_name: first_name, business_unit: business_unit, workplace: workplace, workroom: workroom, site: site)
end

2.times do |i|
  city = Faker::GameOfThrones.city

  site = Site.create!(code: city.parameterize, name: city)
  building = Building.create!(code: "#{city.parameterize}-a", name: "#{city} A", site: site)

  floors = [2, 3, 5, 8, 9]
  floors.each do |floor|
    Floor.create!(code: "#{city.parameterize}-#{floor}", name: "#{floor}a planta", building: building)
  end
  floor_5 = Floor.find_by!(code: "#{city.parameterize}-5")

  workroom_512 = Workroom.create!(code: "#{city.parameterize}-512", name: "DSC#{i}", floor: floor_5)

  business_unit = BusinessUnit.create!(code: "#{i}912", name: "NEGOCIO #{i}")

  starting_code = (rand(9) * 10_000) + (rand(9) * 1_000) + (rand(9) * 100) + (rand(9) * 10) + rand(9)

  rand(40..50).times do |i|
    generate_next(i, starting_code + i, site: site, workroom: workroom_512, business_unit: business_unit, last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, city: city)
  end
end


puts('ok')

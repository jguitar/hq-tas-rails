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
  business_units = 30.times.map do
    ([0, 3, 8, 9].sample * 100) + ([0, 1, 3, 5, 6].sample * 10) + rand(1..10)
  end
  business_units.uniq!
  business_units.sort!
  business_units.map! { |i| i.to_s.rjust(3, '0') }
  business_units.each do |code|
    name = Faker::GameOfThrones.house
    BusinessUnit.create!(code: code, name: name)
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

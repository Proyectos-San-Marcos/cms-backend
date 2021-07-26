# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'

all_managements = JSON.parse(File.read(Rails.root.join('db/json/managements.son')))
all_areas = JSON.parse(File.read(Rails.root.join('db/json/areas.son')))
all_faculties = JSON.parse(File.read(Rails.root.join('db/json/faculties.son')))
all_careers = JSON.parse(File.read(Rails.root.join('db/json/careers.son')))

puts "Creating Managements..."
all_managements.each do |management|
  Management.create(
    name: management['name']
  )
end
puts "Managements created!"

puts "Creating Areas..."
all_area.each do |area|
  Area.create(
    name: area['name'],
    management: Management.find_by(name: area['management'])
  )
end
puts "Areas created!"

puts "Creating Faculties..."
all_faculties.each do |faculty|
  Faculty.create(
    name: faculty['name']
  )
end
puts "Faculties created!"

puts "Creating Careers..."
all_careers.each do |career|
  Career.create(
    name: career['name'],
    management: Faculty.find_by(name: career['faculty'])
  )
end
puts "Careers created!"

puts "Creating Users..."
50.times do
  User.create(
    username:,
    first_name:,
    last_name:,
    phone:,
    dni:,
    address:,
    email:,
    birthday:,
    unmsm_code:,
    cicle:,
    registered_at:,
    area:,
    career:,
    role:,
    status:
  )
end
puts "Users created!"
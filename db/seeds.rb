# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'

all_managements = JSON.parse(File.read(Rails.root.join('db/json/managements.json')))
all_areas = JSON.parse(File.read(Rails.root.join('db/json/areas.json')))
all_faculties = JSON.parse(File.read(Rails.root.join('db/json/faculties.json')))
all_careers = JSON.parse(File.read(Rails.root.join('db/json/careers.json')))

puts "Creating Managements..."
all_managements.each do |management|
  Management.create(
    name: management['name']
  )
end
puts "Managements created!"

puts "Creating Areas..."
all_areas.each do |area|
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
    faculty: Faculty.find_by(name: career['faculty'])
  )
end
puts "Careers created!"

puts "Creating Users..."
50.times do
  User.create(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: rand(900000000..999999999),
    dni: Faker::IDNumber.brazilian_id,
    address: Faker::Address.full_address,
    email:  Faker::Internet.safe_email,
    birthday: Faker::Date.birthday,
    unmsm_code: rand.to_s[2..10].to_i,
    cicle: rand(1..10),
    registered_at: Faker::Date.between(from: '2011-07-26', to: Date.today),
    area: Area.order(Arel.sql('RANDOM()')).first,
    career: Career.order(Arel.sql('RANDOM()')).first,
    role: rand(1..3),
    status: rand(1..3)
  )
end
puts "Users created!"
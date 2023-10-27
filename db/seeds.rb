# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker' 

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinTableDoctorSpecialty.destroy_all
#=> comme ça à chaque phase de test ça ne me génère pas mille instances

5.times do |index|
  City.create!(
    name: Faker::Address.city
   )
end

5.times do |index|
   Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: City.all.sample
    )
end

15.times do |index|
   Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample
   )
end

30.times do |index|
   Appointment.create!(
     date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 35, format: :short),
     doctor: Doctor.all.sample,
     patient: Patient.all.sample,
     city: City.all.sample
   )
end



# Create 5 specialty
Specialty.create(name: 'Family medecine')
Specialty.create(name: 'Pediatrician')
Specialty.create(name: 'Cardiologist')
Specialty.create(name: 'Pulmonologist')
Specialty.create(name: 'Dermatologist')


7.times do |index|
  JoinTableDoctorSpecialty.create!(
    doctor: Doctor.all.sample,
    specialty: Specialty.all.sample
  )
end
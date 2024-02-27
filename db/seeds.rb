# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Clearing all pets before each db:seed
puts "destroying all pets..."
Pet.destroy_all

# db/seeds.rb

# Defining common dog breeds
COMMON_BREEDS = [
  "Labrador Retriever",
  "German Shepherd",
  "Golden Retriever",
  "Bulldog",
  "Beagle",
  "Poodle",
  "Boxer",
  "Dachshund",
  "Siberian Husky",
  "Great Dane",
  "Chihuahua",
  "Shih Tzu",
  "Yorkshire Terrier",
  "Pug",
  "Border Collie"
]

# Define common male and female names for dogs
MALE_NAMES = ["Max", "Buddy", "Charlie", "Jack", "Cooper", "Rocky", "Bear", "Duke", "Tucker", "Oliver"]
FEMALE_NAMES = ["Bella", "Lucy", "Daisy", "Molly", "Sadie", "Lola", "Sophie", "Bailey", "Luna", "Zoe"]

# Seed Pet data
20.times do
  name = [MALE_NAMES.sample, FEMALE_NAMES.sample].sample
  age = rand(2..15)
  breed = COMMON_BREEDS.sample
  sex = ["male", "female"].sample
  neutered = [true, false].sample
  size = case breed
         when "Chihuahua", "Shih Tzu", "Yorkshire Terrier", "Pomeranian"
           "small"
         when "Beagle", "Cocker Spaniel", "Dachshund", "French Bulldog", "Pug"
           "medium"
         else
           "large"
         end

  Pet.create!(
    name: name,
    age: age,
    breed: breed,
    sex: sex,
    neutered_spayed: neutered,
    size: size
  )
end

puts "Seed data generated successfully."

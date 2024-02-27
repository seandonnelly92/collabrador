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
require 'date'


puts "destroying all appointments"
Appointment.destroy_all

puts "destroying all pets..."
Pet.destroy_all


puts "destroying all users..."
User.destroy_all



## Randomly generated Users

users = {
  user_1: {
    first_name: "Alex",
    last_name: "Smith",
    postcode: "E1 6AN",
    password: "password",
    email: "alex.smith@lewagon.com"
  },
  user_2: {
    first_name: "Jamie",
    last_name: "Brown",
    postcode: "N1 9GU",
    password: "password",
    email: "jamie.brown@lewagon.com"
  },
  user_3: {
    first_name: "Taylor",
    last_name: "Johnson",
    postcode: "W1T 3NF",
    password: "password",
    email: "taylor.johnson@lewagon.com"
  },
  user_4: {
    first_name: "Casey",
    last_name: "Lee",
    postcode: "SE1 9SG",
    password: "password",
    email: "casey.lee@lewagon.com"
  },
  user_5: {
    first_name: "Jordan",
    last_name: "Davis",
    postcode: "SW1A 1AA",
    password: "password",
    email: "jordan.davis@lewagon.com"
  },
  user_6: {
    first_name: "Morgan",
    last_name: "White",
    postcode: "EC1A 1BB",
    password: "password",
    email: "morgan.white@lewagon.com"
  },
  user_7: {
    first_name: "Drew",
    last_name: "Moore",
    postcode: "NW1 6XE",
    password: "password",
    email: "drew.moore@lewagon.com"
  },
  user_8: {
    first_name: "Sam",
    last_name: "Taylor",
    postcode: "WC1N 3AX",
    password: "password",
    email: "sam.taylor@lewagon.com"
  },
  user_9: {
    first_name: "Alexis",
    last_name: "Martin",
    postcode: "E2 8AA",
    password: "password",
    email: "alexis.martin@lewagon.com"
  },
  user_10: {
    first_name: "Robin",
    last_name: "Jackson",
    postcode: "SW1W 0NY",
    password: "password",
    email: "robin.jackson@lewagon.com"
  }
}

## Seeding users
users.each do |key, user_data|
  User.create!(
    first_name: user_data[:first_name],
    last_name: user_data[:last_name],
    postcode: user_data[:postcode],
    password: user_data[:password],
    email: user_data[:email]
  )
end

puts "User data seeded successfully."


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

User.all.each do |user|
  name = [MALE_NAMES.sample, FEMALE_NAMES.sample].sample
  age = rand(2..15)
  breed = COMMON_BREEDS.sample
  sex = ["male", "female"].sample
  activity_needs = ["high", "medium", "low"].sample
  neutered = [true, false].sample
  child_friendly = [true, false].sample
  cat_friendly = [true, false].sample
  dog_friendly = [true, false].sample
  hypoallergenic = [true, false].sample

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
    animal_type: "Dog",
    age: age,
    breed: breed,
    sex: sex,
    activity_needs: activity_needs,
    child_friendly: child_friendly,
    cat_friendly: cat_friendly,
    dog_friendly: dog_friendly,
    neutered_spayed: neutered,
    hypoallergenic: hypoallergenic,
    size: size,
    user: user
  )
end

puts "Pet seeded successfully."

# Function to generate a random time between 08:00 and 21:00
def generate_random_time
  hour = rand(8..20) # Random hour between 8 and 20 (inclusive)
  minute = rand(0..59) # Random minute between 0 and 59
  second = rand(0..59) # Random second between 0 and 59
  DateTime.now.change(hour: hour, min: minute, sec: second)
end

appointments = {}

# Generate appointments

20.times do |i|
  appointment_key = "appointment #{i+1}"
  days_ahead = rand(0..90)
  current_date = DateTime.now
  random_future_date = current_date + days_ahead
  random_time = generate_random_time
  random_future_datetime = random_future_date.change(hour: random_time.hour, min: random_time.minute, sec: random_time.second)
  location = "park #{rand(1..5)}"
  end_date = random_future_datetime + Rational(1, 24)
  appointment_info = {
    'start_date' => random_future_datetime,
    'end_date' => end_date,
    'location' => location
  }

  appointments[appointment_key] = appointment_info
end

def valid_pet_owner(user)
  valid = false
  until valid
    pet = Pet.all.sample
    valid = pet.user_id != user.id
  end
  return pet
end

available_appointments = (1..20).to_a

activity_types = ["walking", "feeding", "boarding", "overnight", "socialising"]

User.all.each do |user|
  2.times do
    appointment_key = "appointment #{available_appointments.delete_at(0)}"
    appointment_info = appointments[appointment_key]
    appointment = Appointment.new
    # puts "CHECKING HERE"
    # puts "Appointment key is: #{appointment_key}"
    # puts "Appointment info is: #{appointment_info}"
    appointment.start_date = appointment_info['start_date']
    appointment.end_date = appointment_info['end_date']
    appointment.location = appointment_info['location']
    appointment.user = user
    appointment.pet = valid_pet_owner(user)
    appointment.looking_for = activity_types.sample
    appointment.save!
  end
end

puts "Appointments seeded successfully."

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

puts "destroying all appointments..."
Appointment.destroy_all

puts "destroying all pets..."
Pet.destroy_all

puts "destroying all users..."
User.destroy_all

# Adding Jasper
jasper = User.new(
  first_name: "Jasper",
  last_name: "Warmenhoven",
  postcode: "WC2E 7DU",
  email: "jasper@lewagon.com",
  password: "password",
  picture_url: "https://avatars.githubusercontent.com/u/38129807?v=4"
)
jasper.save

theo = Pet.new(
  name: "Theo",
  age: 2,
  sex: "male",
  animal_type: "dog",
  breed: "labrador",
  size: "medium",
  activity_needs: "medium",
  neutered_spayed: true,
  child_friendly: true,
  dog_friendly: true,
  cat_friendly: false,
  hypoallergenic: false,
  town: "Covent Garden",
  bio: "I hail from the Netherlands but have found my second home in London, where I dive into the world of web development. My sidekick, Theo, a 2-year-old Labrador with a zest for life, shares my adventures. While he's not too fond of cats, give him a puddle to jump into, and he's the happiest dog on the block. Our walks are never just walks; they're joyful explorations, with Theo leading the charge into every splash of water we come across."
)
theo_pictures = ['app/assets/images/dog_pic_theo_1.jpg', 'app/assets/images/dog_pic_theo_2.jpg']
theo_pictures.each do |pic|
  image_io = File.open(pic)
  file_name = pic.split('/')[-1]
  theo.pet_photos.attach(io: image_io, filename: file_name, content_type: 'image/jpg')
end
theo.user = jasper
theo.save

# Adding Sean
sean = User.new(
  first_name: "Sean",
  last_name: "Donnelly",
  postcode: "N1 0PN",
  email: "sean@lewagon.com",
  password: "password",
  picture_url: "https://avatars.githubusercontent.com/u/34680960?v=4"
)
sean.save

cleo = Pet.new(
  name: "Cleo",
  age: 5,
  sex: "female",
  animal_type: "dog",
  breed: "cockapoo",
  size: "medium",
  activity_needs: "high",
  neutered_spayed: true,
  child_friendly: true,
  dog_friendly: true,
  cat_friendly: false,
  hypoallergenic: true,
  town: "Islington",
  bio: "Living in Islington as a tech-founder, I navigate the bustling world of startups with Cleo, my exuberant cockapoo, always by my side. She embodies high energy and is arguably the friendliest dog you'll ever meet — unless you're a cat, that is. Our days are filled with her boundless enthusiasm, making every moment a delightful escapade, her tail wagging in pure joy at every new face she meets."
)
cleo_pictures = ['app/assets/images/dog_pic_cleo_1.jpg', 'app/assets/images/dog_pic_cleo_2.jpg', 'app/assets/images/dog_pic_cleo_3.jpg']
cleo_pictures.each do |pic|
  image_io = File.open(pic)
  file_name = pic.split('/')[-1]
  cleo.pet_photos.attach(io: image_io, filename: file_name, content_type: 'image/jpg')
end
cleo.user = sean
cleo.save

# Adding Tom
tom = User.new(
  first_name: "Tom",
  last_name: "Ellwood",
  postcode: "EC1R 4QL",
  email: "tom@lewagon.com",
  password: "password",
  picture_url: "https://avatars.githubusercontent.com/u/142323005?v=4"
)
tom.save

boris = Pet.new(
  name: "Boris",
  age: 3,
  sex: "male",
  animal_type: "dog",
  breed: "husky",
  size: "large",
  activity_needs: "high",
  neutered_spayed: true,
  child_friendly: false,
  dog_friendly: true,
  cat_friendly: false,
  hypoallergenic: false,
  town: "Clerkenwell",
  bio: "My transition from teaching to full-stack development brought many changes, but none as constant as my companion, Boris. We reside in Clerkenwell with my wife, and this 3-year-old Husky is a bundle of energy that loves nothing more than our runs in the local park. However, it's our annual winter trips to Finland that he lives for, where he can dash through the snow, his spirit as free as the winter wind. His love for the chilly outdoors makes every trip an unforgettable journey."
)
boris_pictures = ['app/assets/images/dog_pic_boris_1.jpg', 'app/assets/images/dog_pic_boris_2.jpg', 'app/assets/images/dog_pic_boris_3.jpg']
boris_pictures.each do |pic|
  image_io = File.open(pic)
  file_name = pic.split('/')[-1]
  boris.pet_photos.attach(io: image_io, filename: file_name, content_type: 'image/jpg')
end
boris.user = tom
puts "Boris save is #{boris.valid?}"
boris.save

# Adding Rowan
rowan = User.new(
  first_name: "Rowan",
  last_name: "Heptinstall",
  postcode: "N4 2DW",
  email: "rowan@lewagon.com",
  password: "password",
  picture_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1705241307/q1aeefju2sajr9jxmls0.jpg"
)
rowan.save

lola = Pet.new(
  name: "Lola",
  age: 3,
  sex: "female",
  animal_type: "dog",
  breed: "spoodle",
  size: "medium",
  activity_needs: "high",
  neutered_spayed: true,
  child_friendly: true,
  dog_friendly: false,
  cat_friendly: true,
  hypoallergenic: true,
  town: "Finsbury Park",
  bio: "As a software engineer living in Finsbury Park, my life is a blend of code and canine companionship, thanks to Lola, my spoodle. Unlike most dogs, Lola prefers the company of cats, making friends with every feline in the neighborhood. This unique trait ensures she's always the center of attention, a role she seems to relish. With Lola, every day is an adventure in diplomacy, as she navigates her circle of cat and human friends with equal aplomb, ensuring all eyes are on her."
)
lola_pictures = ['app/assets/images/dog_pic_lola_1.jpg', 'app/assets/images/dog_pic_lola_2.jpg', 'app/assets/images/dog_pic_lola_3.jpg']
lola_pictures.each do |pic|
  image_io = File.open(pic)
  file_name = pic.split('/')[-1]
  lola.pet_photos.attach(io: image_io, filename: file_name, content_type: 'image/jpg')
end
lola.user = rowan
puts "Lola save is #{lola.valid?}"
lola.save

## Randomly generated additional Users
puts "Seeding users..."
users = {
  user_1: {
    first_name: "Alex",
    last_name: "Smith",
    postcode: "E1 6AN",
    password: "password",
    email: "alex.smith@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1532469060546-4eb37b460481?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29uJTIwd2l0aCUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D"
  },
  user_2: {
    first_name: "Jamie",
    last_name: "Brown",
    postcode: "N1 9GU",
    password: "password",
    email: "jamie.brown@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1557199582-14cd70bc6d39?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlcnNvbiUyMHdpdGglMjBkb2d8ZW58MHx8MHx8fDA%3D"
  },
  user_3: {
    first_name: "Taylor",
    last_name: "Johnson",
    postcode: "W1T 3NF",
    password: "password",
    email: "taylor.johnson@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1557495235-340eb888a9fb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29uJTIwd2l0aCUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D"
  },
  user_4: {
    first_name: "Casey",
    last_name: "Lee",
    postcode: "SE1 9SG",
    password: "password",
    email: "casey.lee@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1579119134757-5c38803f34fc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyc29uJTIwd2l0aCUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D"
  },
  user_5: {
    first_name: "Jordan",
    last_name: "Davis",
    postcode: "SW1A 1AA",
    password: "password",
    email: "jordan.davis@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1536780250812-9c417ccad37d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBlcnNvbiUyMHdpdGglMjBkb2d8ZW58MHx8MHx8fDA%3D"
  },
  user_6: {
    first_name: "Morgan",
    last_name: "White",
    postcode: "EC1A 1BB",
    password: "password",
    email: "morgan.white@lewagon.com",
    picture_url: "https://images.unsplash.com/flagged/photo-1579195107754-c8fe9ee2ddfc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbiUyMHdpdGglMjBkb2d8ZW58MHx8MHx8fDA%3D"
  },
  user_7: {
    first_name: "Drew",
    last_name: "Moore",
    postcode: "NW1 6XE",
    password: "password",
    email: "drew.moore@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1587143185708-674ef4a1c09b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHBlcnNvbiUyMHdpdGglMjBkb2d8ZW58MHx8MHx8fDA%3D"
  },
  user_8: {
    first_name: "Sam",
    last_name: "Taylor",
    postcode: "WC1N 3AX",
    password: "password",
    email: "sam.taylor@lewagon.com",
    pictrure_url: "https://images.unsplash.com/photo-1522276498395-f4f68f7f8454?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9nJTIwYW5kJTIwb3duZXJ8ZW58MHx8MHx8fDA%3D"
  },
  user_9: {
    first_name: "Alexis",
    last_name: "Martin",
    postcode: "E2 8AA",
    password: "password",
    email: "alexis.martin@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1632498301446-5f78baad40d0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRvZyUyMGFuZCUyMG93bmVyfGVufDB8fDB8fHww"
  },
  user_10: {
    first_name: "Robin",
    last_name: "Jackson",
    postcode: "SW1W 0NY",
    password: "password",
    email: "robin.jackson@lewagon.com",
    picture_url: "https://images.unsplash.com/photo-1602205412668-8c77d02a48b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9nJTIwYW5kJTIwb3duZXJ8ZW58MHx8MHx8fDA%3D"
  }
}

## Seeding users
users.each_value do |user_data|
  User.create!(
    first_name: user_data[:first_name],
    last_name: user_data[:last_name],
    postcode: user_data[:postcode],
    password: user_data[:password],
    email: user_data[:email],
    picture_url: user_data[:picture_url]
  )
end

puts "User data seeded successfully."

puts "Seeding pets (dogs)..."
# Defining common dog breeds
COMMON_BREEDS = [
  "Labrador",
  "Newfoundland",
  "Pomeranian",
  "Pyrenees",
  "Vizsla",
  "Whippet",
  "Doberman",
  "Dachshund",
  "Chihuahua",
  "Boxer",
  "Beagle",
]


# Define common male and female names for dogs
MALE_NAMES = ["Max", "Buddy", "Charlie", "Jack", "Cooper", "Rocky", "Bear", "Duke", "Tucker", "Oliver"]
FEMALE_NAMES = ["Bella", "Lucy", "Daisy", "Molly", "Sadie", "Lola", "Sophie", "Bailey", "Luna", "Zoe"]


#Fetching dog images from dog API
def get_random_dog_image_by_breed(breed)
  url = "https://dog.ceo/api/breed/#{breed}/images/random"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  if data["status"] == "success"
    return data["message"]
  else
    return nil
  end
end

# Seed Pet data

User.all.each do |user|
  name = [MALE_NAMES.sample, FEMALE_NAMES.sample].sample
  age = rand(2..15)
  breed = COMMON_BREEDS.sample
  breed_img_title = breed.downcase
  puts breed_img_title
  sex = ["male", "female"].sample
  activity_needs = ["high", "medium", "low"].sample
  neutered = [true, false].sample
  child_friendly = [true, false].sample
  cat_friendly = [true, false].sample
  dog_friendly = [true, false].sample
  hypoallergenic = [true, false].sample

  size = case breed
  when "Chihuahua","Pomeranian", "Dachsund", "Beagle"
    "small"
  when "Vizsla", "Whippet", "Boxer"
    "medium"
  else
    "large"
  end

  dog_image = get_random_dog_image_by_breed(breed_img_title)

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
    user: user,
    dog_image: dog_image
  )
end

puts "Pet seeded successfully."
puts "Seeding appointments.."

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

class Appointment < ApplicationRecord
  belongs_to :pet
  # Allows to call appointment.owner to get the pet_owner_id of the review (through pet)
  # belongs_to :owner, class_name: 'User', through: :pet, foreign_key: :user_id
  belongs_to :user
end

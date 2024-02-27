class Appointment < ApplicationRecord
  belongs_to :pet
  # Allows to call appointment.owner to get the pet_owner_id of the review (through pet)
  belongs_to :owner, class_name: 'User', foreign_key: :user_id, through: :pet
  belongs_to :user
end

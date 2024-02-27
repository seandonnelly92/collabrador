class Review < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
  belongs_to :pet, through: :appointment
  # Allows to call review.owner to get the pet_owner_id of the review (based on pet through appointment)
  belongs_to :owner, class_name: 'User', foreign_key: :user_id, through: :pet
end

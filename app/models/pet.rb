class Pet < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :reviews, through: :appointments
end

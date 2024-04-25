class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?

  has_many :pets
  has_many :reviews
  has_many :appointments
  has_many :messages

  has_one_attached :profile_picture
end

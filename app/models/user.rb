class User < ApplicationRecord
  has_many :bookings
  has_many :cars, through: :bookings

  has_secure_password
end

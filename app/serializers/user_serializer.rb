class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :admin
  has_many :bookings
  has_many :cars, through: :bookings
end

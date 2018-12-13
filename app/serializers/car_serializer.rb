class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :top_speed, :range, :charge_time, :price_per_day
  has_many :bookings
end

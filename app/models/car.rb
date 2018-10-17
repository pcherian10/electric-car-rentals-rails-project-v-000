class Car < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :top_speed, numericality: true
  validates :range, numericality: true
  validates :charge_time, numericality: true
  validates :price_per_day, numericality: true

  scope :fastestcar, -> {order('top_speed DESC').first.name}



end

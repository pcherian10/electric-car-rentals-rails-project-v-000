class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car


  def valid_date
    self.start_date < self.end_date
  end

  def duplicate_booking
    Booking.all.each do |booking|
      if booking.id != self.id
        if booking.car == self.car
          if self.start_date <= booking.end_date && self.start_date >= booking.start_date || self.end_date <= booking.end_date && self.end_date >= booking.start_date
            return true
          end
        end
      end
    end
  end

  def return_available_dates
    Booking.all.each do |booking|
      if self.start_date <= booking.end_date && self.start_date >= booking.start_date || self.end_date <= booking.end_date && self.end_date >= booking.start_date
          return "This car is not available between #{booking.start_date} and #{booking.end_date}. Choose another time! Thanks."
      end
    end
  end

  def revenue
    "$" + (( self.end_date - self.start_date ).to_i * self.car.price_per_day).to_s
  end





end

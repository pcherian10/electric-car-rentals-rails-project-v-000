class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car


  def valid_date
    self.start_date < self.end_date
  end


end

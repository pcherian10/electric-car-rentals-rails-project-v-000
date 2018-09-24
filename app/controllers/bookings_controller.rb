class BookingsController < ApplicationController

  def new
    @booking = Booking.create(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(
      :start_date,
      :end_date,
      :user_id,
      :car_id
    )
end

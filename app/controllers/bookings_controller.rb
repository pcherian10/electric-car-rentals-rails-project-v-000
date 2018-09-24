class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @cars = Car.all
  end

  def create

  end

  private

  def booking_params
    params.require(:booking).permit(
      :start_date,
      :end_date,
      :user_id => params[:user_id],
      :car_id => params[:car_id]
    )
  end

end

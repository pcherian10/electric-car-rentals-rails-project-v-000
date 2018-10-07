class Admin::BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @cars = Car.all
  end

  def show
    @booking = Booking.find_by_id(params[:id])
  end


end

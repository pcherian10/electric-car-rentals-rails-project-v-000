class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      redirect_to new_booking_path
    end
  end

  def edit
    @booking = Booking.find_by_id(params[:id])
    @user = @booking.user
  end

  def update
    @booking.update(booking_params)
    binding.pry
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end

end

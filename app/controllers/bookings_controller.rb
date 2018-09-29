class BookingsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find_by_id(params[:id])
    @user = @booking.user
  end

  def update
    @booking = Booking.find_by_id(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @user
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end

end

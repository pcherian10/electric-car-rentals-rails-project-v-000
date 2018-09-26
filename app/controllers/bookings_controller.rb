class BookingsController < ApplicationController
  def new
    @booking = Booking.create(:start_date => params[:start_date], :end_date => params[:end_date],
      :user_id => params[:user_id],
      :car_id => params[:car_id]
    )
    redirect_to user_path(@booking.user)
  end

  def edit
    @user = User.find_by_id(params[:id])
    @booking = Booking.find_by_id(params[:id])
  end
end

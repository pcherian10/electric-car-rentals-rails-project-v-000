class BookingsController < ApplicationController

  def show
    @booking = Booking.find_by_id(params[:id])
    @user = @booking.user
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @booking.to_json }
    end

  end

  def new
    @user = User.find_by_id(params[:user_id])
    @car = Car.find_by_id(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @car = @booking.car
    if @booking.valid? && @booking.valid_date && @booking.duplicate_booking != true
      @booking.save
      redirect_to user_path(@booking.user)
    else
      if !@booking.valid_date
        flash[:message] = "Check your dates and try again!"
      elsif @booking.duplicate_booking
        flash[:message] = @booking.return_available_dates
      end
      redirect_to new_user_booking_path(:user_id => session[:user_id], :car_id => @car.id)
    end
  end

  def edit
    @booking = Booking.find_by_id(params[:id])
    @user = @booking.user
  end

  def update
    @booking = Booking.find_by_id(params[:id])
    @booking.assign_attributes(booking_params)
    if @booking.valid_date && @booking.duplicate_booking != true
        @booking.save(booking_params)
        redirect_to user_path(@booking.user)
    else
      if !@booking.valid_date
        flash[:message] = "Check your dates and try again!"
      elsif @booking.duplicate_booking
        flash[:message] = @booking.return_available_dates
      end
      redirect_to edit_user_booking_path
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

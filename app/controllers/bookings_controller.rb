class BookingsController < ApplicationController

  def ajax_booking
      @user = User.find_by_id(params[:user_id])
      @car = Car.find_by_id(params[:car_id])
      @booking = Booking.new
      render partial: "ajaxnew", locals: {user: @user, car: @car}
  end

  def ajax_edit_booking
      @user = User.find_by_id(params[:user_id])
      @booking = Booking.find_by_id(params[:id])
      render partial: "ajaxedit", locals: {booking: @booking}
  end

  def index
    @bookings = Booking.all
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @bookings}
    end
  end

  def show
    @booking = Booking.find_by_id(params[:id])
    @user = @booking.user
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
      respond_to do |f|
        f.html {redirect_to user_path(@booking.user)}
        f.json {render :json => @booking.user}
      end
    else
      if !@booking.valid_date
        flash[:message] = "Check your dates and try again!"
      elsif @booking.duplicate_booking
        flash[:message] = @booking.return_available_dates
      end
      respond_to do |f|
        f.html {redirect_to user_path(@booking.user)}
        f.json {render :json => @booking.user }
      end
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
        respond_to do |f|
          f.html {redirect_to user_path(@booking.user)}
          f.json {render :json => @booking.user}
        end
    else
      if !@booking.valid_date
        flash[:message] = "Check your dates and try again!"
      elsif @booking.duplicate_booking
        flash[:message] = @booking.return_available_dates
      end
      respond_to do |f|
        f.html {redirect_to user_path(@booking.user)}
        f.json {render :json => @booking.user}
      end
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

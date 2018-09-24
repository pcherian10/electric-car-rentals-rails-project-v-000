class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def update
      if @car.update(car_params)
        redirect_to @car, notice "Car details were successfully updated."}
      else
        render :edit
      end
  end

  def create
    @car = Car.new(car_params)
    @car.save
      if @car
        redirect_to car_path(@car)
      end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: "Car was successfully deleted."}
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(
      :manufacturer,
      :model,
      :top_speed,
      :range,
      :charge_time,
      :price_per_day
    )
end

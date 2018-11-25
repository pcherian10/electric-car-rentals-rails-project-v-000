class Admin::CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find_by_id(params[:id])

  end


  def new
    @car = Car.new
  end

  def update
      if @car.update(car_params)
        redirect_to admin_cars_path, notice: "Car details were successfully updated."
      else
        render :edit
      end
  end

  def create
    @car = Car.new(car_params)
    if @car.valid?
        @car.save
        redirect_to admin_cars_path, notice: "Car was successfully added."
    else
      render :new
    end

  end

  def destroy
    @car.destroy
    redirect_to admin_cars_path, notice: "Car was successfully deleted."
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(
      :name,
      :top_speed,
      :range,
      :charge_time,
      :price_per_day
    )
  end

end

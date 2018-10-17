class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def fastestcar
    #@car = Car.order("top_speed DESC").first
  end

  def index
    @cars = Car.order("#{sort_column} #{sort_direction}")
    @user = User.find_by_id(params[:user_id])
  end

  def show
    @car = Car.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])
  end


  def new
    @car = Car.new
  end

  def update
      if @car.update(car_params)
        redirect_to @car, notice: "Car details were successfully updated."
      else
        render :edit
      end
  end

  def create
    @car = Car.new(car_params)

    if @car.valid?
        @car.save
        redirect_to car_path(@car.id)
    else
      render :new
    end

  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: "Car was successfully deleted."
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

  def sortable_columns
    ["name", "top_speed", "range", "charge_time", "price_per_day"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

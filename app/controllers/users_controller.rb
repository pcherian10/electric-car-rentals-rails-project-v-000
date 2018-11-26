class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def show
    @user = User.find_by_id(params[:id])
    @cars = Car.order("#{sort_column} #{sort_direction}")
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome to E-Cars Rental Service!"
      else
        render :new
      end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :admin
    )
  end

  private

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

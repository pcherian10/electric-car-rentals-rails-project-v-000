class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
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

end

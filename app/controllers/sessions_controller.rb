class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome to E-Cars Rentals!"
      else
        redirect_to signin_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end

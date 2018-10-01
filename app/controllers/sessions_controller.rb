class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user_path(id: user.id)
    else
      @user = User.find_by(name: params[:user][:name])
       if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome to E-Cars Rentals!"
       else
          flash[:notice] = "Incorrect username and/or password combination."
          redirect_to signin_path
       end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end

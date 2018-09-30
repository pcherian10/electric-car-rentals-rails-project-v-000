class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_path(id: user.id)
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

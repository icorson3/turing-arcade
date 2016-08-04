class SessionsController < ApplicationController

  def create
   user = User.from_omniauth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/profile'
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirects_to '/'
  end
end

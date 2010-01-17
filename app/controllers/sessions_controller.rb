class SessionsController < ApplicationController

  def new
  end

  def create
    if authenticate && logged_in?
      flash[:notice] = "Login successful!"
      redirect_back_or_default "/"
    else
      flash[:error] = "Password Denied unable to log in"
      redirect_to login_url
    end
  end

  def destroy
    logout
    flash[:notice] = "You have been logged out"
    redirect_to "/"
  end


end

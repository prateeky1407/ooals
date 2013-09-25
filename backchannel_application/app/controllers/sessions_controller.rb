class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      redirect_to posts_path , :notice => "Login Successful."
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

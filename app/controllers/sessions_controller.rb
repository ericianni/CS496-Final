class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome to the Test App!"
      redirect_to user
    else
      flash[:danger]  = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
  
end

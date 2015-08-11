class Api::UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: '{"status":"success"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end

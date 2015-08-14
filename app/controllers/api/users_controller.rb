class Api::UsersController < ApplicationController

  def new
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: '{"status":"success", "id":"' + user.id + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: '{"status":"success", "id":"' + @user.id + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def add_vocab
    @user = User.find(params[:user_param])
    @vocab = Vocab.find(params[:vocab_param])
    @vocabs = @user.vocabs
    @vocabs << @vocab
    if @user.update_attribute(:vocabs, @vocabs)
      render json: '{"status":"success"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  def remove_vocab
    @user = User.find(params[:user_param])
    vocab = Vocab.find(params[:vocab_param])
    vocabs = @user.vocabs.compact
    vocabs.delete(vocab)
    if @user.update_attribute(:vocabs, vocabs)
      render json: '{"status":"success"}'
    else
      render json: '{"status"::failure"}'
    end
  end
  
  private
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end

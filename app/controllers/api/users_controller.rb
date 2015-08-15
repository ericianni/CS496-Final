class Api::UsersController < ApplicationController

  def new
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      username = user.username
      id = user.id
      email = user.email
      json_string = '{"status":"success",'
      json_string += '"id":"' + id + '",'
      json_string += '"email":"' + email + '",'
      json_string += '"username":"' + username + '"}'
      render json: json_string
    else
      render json: '{"status":"failure"}'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      username = @user.username
      id = @user.id
      email = @user.email
      json_string = '{"status":"success",'
      json_string += '"id":"' + id + '",'
      json_string += '"email":"' + email + '",'
      json_string += '"username":"' + username + '"}'
      render json: json_string
    else
      render json: '{"status":"failure"}'
    end
  end

  def update
    @user = User.find(params[:id])
    password = @user.password
    password_confirmation = @user.password_confirmation
#    user_params[:password] = password
#    user_params[:password_confirmation] = password_confirmation
    if @user.update_attributes(user_params)
      render json: '{"status":"success"}'
    else
      render json: '{"username":"' + user_params[:username] + '","email":"' + user_params[:email] + '","size":"'+ user_params.length +'"}'
#      render json: '{"status":"failure"}'
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

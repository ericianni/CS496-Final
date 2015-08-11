class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def add_vocab
    @user = User.find(params[:user_param])
    @vocab = Vocab.find(params[:vocab_param])
    @vocabs = @user.vocabs
    @vocabs << @vocab
    if @user.update_attribute(:vocabs, @vocabs)
      flash[:success] = "Vocab added"
      redirect_to @user
    else
      flash[:danger] = "Trouble adding vocab"
      redirect_to @user
    end
  end

  def remove_vocab
    @user = User.find(params[:user_param])
    vocab = Vocab.find(params[:vocab_param])
    vocabs = @user.vocabs.compact
    vocabs.delete(vocab)
    if @user.update_attribute(:vocabs, vocabs)
      flash[:success] = "Vocab removed"
      redirect_to @user
    else
      flash[:danger] = "Trouble removing vocab"
      redirect_to @user
    end
  end
  
  def show
    @user = User.find(params[:id])
    @vocab = Vocab.all
    @vocabs = @user.vocabs
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end

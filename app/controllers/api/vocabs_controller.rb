class Api::VocabsController < ApplicationController

  def new
  end

  def create
    @vocab = Vocab.new(vocab_params)
    if @vocab.save
      render json: '{"status":"success"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  def show
    @vocab = Vocab.find(params[:id])
  end

  def all
    @vocab = Vocab.all
  end

  private
  def vocab_params
    params.permit(:dict_entry, :part_of_speech, :definition)
  end
  
end

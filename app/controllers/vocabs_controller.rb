class VocabsController < ApplicationController

  def new
    @vocab = Vocab.new
  end

  def create
    @vocab = Vocab.new(vocab_params)
    if @vocab.save
      redirect_to @vocab
    else
      render 'new'
    end
  end

  def show
    @vocab = Vocab.find(params[:id])
  end

  def edit
    @vocab = Vocab.find(params[:id])
  end
  
  def update
    @vocab = Vocab.find(params[:id])
    if @vocab.update_attributes(vocab_params)
      redirect_to @vocab
    else
      render 'edit'
    end
  end

  def all
    @vocab = Vocab.all
  end

  def destroy
    Vocab.find(params[:id].destroy)
    redirect_to vocab_all__path
  end

  private
  def vocab_params
    params.require(:vocab).permit(:dict_entry, :definition, :part_of_speech)
  end
  
end

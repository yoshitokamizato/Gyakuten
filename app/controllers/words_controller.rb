class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(words_params)
    redirect_to :action => "index"
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update(words_params)
    redirect_to :action => "index"
  end

  def destroy
    word = Word.find(params[:id])
    word.delete
    redirect_to :action => "index"
  end

  private

  def words_params
    params.require(:word).permit(:about, :words)
  end
end

class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

end

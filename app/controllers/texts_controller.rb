class TextsController < ApplicationController
  def index
    @texts = Text.show_contents_list
  end

  def show
    @text = Text.find(params[:id])
  end
end

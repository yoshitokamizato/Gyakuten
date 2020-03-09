class TextsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @texts = Text.show_contents_list
  end

  def show
    @text = Text.find(params[:id])
  end
end

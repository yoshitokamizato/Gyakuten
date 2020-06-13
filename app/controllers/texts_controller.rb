class TextsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @texts = Text.show_contents_list
  end

  def show
    @text = Text.find(params[:id])
  end
end

class TextsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
    skip_before_action :approval_user!, only: :index

  def index
    @texts = Text.show_contents_list
    @read_text_ids = current_user.read_texts.pluck(:text_id)
  end

  def show
    @text = Text.find(params[:id])
  end
end

class ReadTextsController < ApplicationController
  def create
    @text_id = params[:text_id]
    current_user.read_texts.create!(text_id: @text_id)
  end

  def destroy
    @text_id = params[:text_id]
    ReadText.find_by(user_id: current_user.id, text_id: @text_id).destroy!
  end
end

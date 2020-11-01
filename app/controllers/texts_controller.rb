class TextsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :approval_user!

  def index
    if params[:genre].nil?
      @texts = Text.show_contents_list
      @read_text_ids = current_user.read_texts.pluck(:text_id)
    elsif Text::OTHER_PROGRAMMING.include?(params[:genre])
      @texts = Text.where(genre: params[:genre]).order(:position)
      @read_text_ids = current_user.read_texts.pluck(:text_id)
    end
  end

  def show
    @text = Text.find(params[:id])
    @next_text_id = Text.where.not(genre: "Other").find_by(position: @text.position + 1)
    if user_signed_in?
      @read_text_ids = current_user.read_texts.pluck(:text_id)
      @movies = @text.movies.order(:position)
      @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
    end
  end
end

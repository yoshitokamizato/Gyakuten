class TextsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :approval_user!

  def index
    @texts = Text.show_contents_list
    @read_text_ids = current_user.read_texts.pluck(:text_id)
  end

  def show
    @text = Text.find(params[:id])
    if user_signed_in?
      @read_text_ids = current_user.read_texts.pluck(:text_id)
      @movies = @text.movies.order(:position)
      @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
    end
  end
end

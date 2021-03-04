class TextsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    code_name = Genre.search_code_name(params[:genre])
    @genre = Genre.search_name(code_name)
    @texts = if code_name.present?
               Text.search_group(code_name).select(Text::SELECT_COLUMNS)
             else
               Text.ruby_group.select(Text::SELECT_COLUMNS)
             end
    @read_text_ids = current_user.read_texts.pluck(:text_id) if user_signed_in?
  end

  def show
    @text = Text.find(params[:id])
    @next_text_id = Text.where(genre_id: @text.genre_id).find_by(position: @text.position + 1)
    if user_signed_in?
      @read_text_ids = current_user.read_texts.pluck(:text_id)
      @movies = @text.movies.order(:position)
      @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
    end
  end
end

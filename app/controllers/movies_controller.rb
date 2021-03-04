class MoviesController < ApplicationController
  PER_PAGE = 18

  def index
    code_name = Genre.search_code_name(params[:genre])
    @genre = Genre.search_name(code_name)
    @movies = if code_name.present?
                Movie.search_group(code_name).page(params[:page]).per(PER_PAGE).select(Movie::SELECT_COLUMNS)
             else
               Movie.ruby_group.page(params[:page]).per(PER_PAGE).select(Movie::SELECT_COLUMNS)
             end
    @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
  end
end

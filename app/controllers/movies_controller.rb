class MoviesController < ApplicationController
  def index
    @movies = Movie.categorized_by(params[:genre], page: params[:page])
    @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
  end
end

class WatchedMoviesController < ApplicationController
  def create
    @movie_id = params[:movie_id]
    current_user.watched_movies.create!(movie_id: @movie_id)
  end

  def destroy
    @movie_id = params[:movie_id]
    WatchedMovie.find_by(user_id: current_user.id, movie_id: @movie_id).destroy!
  end
end

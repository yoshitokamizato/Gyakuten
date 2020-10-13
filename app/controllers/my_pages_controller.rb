class MyPagesController < ApplicationController
  def show
    @read_text_data = Text.read_text_data(current_user)
    @watched_movie_data = Movie.watched_movie_data(current_user)
  end
end

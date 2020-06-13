class MoviesController < ApplicationController

  def index
    @movies = Movie.categorized_by(params[:genre], page: params[:page])
  end
end

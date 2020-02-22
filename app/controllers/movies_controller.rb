class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.categorized_by(genre: params[:genre], page: params[:page])
  end
end

class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.categorize(params[:content_name], params[:page])
  end
end

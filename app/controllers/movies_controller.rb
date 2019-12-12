class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    page = params[:page]
    @level = Movie.count_level(page)
    @movies = Movie.disp_programming(page)
  end

end

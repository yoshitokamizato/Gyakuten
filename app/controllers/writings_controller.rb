class WritingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @writing_movies = Movie.disp_writings
  end
end

class MoviesController < ApplicationController
  skip_before_action :approval_user!

  def index
    @movies = Movie.categorized_by(params[:genre], page: params[:page]) if current_user.flag
  end
end

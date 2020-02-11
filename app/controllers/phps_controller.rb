class PhpsController < ApplicationController
  before_action :authenticate_user!

  def index
    @php_movies = Movie.disp_phps
  end
end

class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index

    if params[:content_name]

      case params[:content_name]
      when "movies"
        page = params[:page]
        @level = Movie.count_level(page)
        @movies = Movie.disp_programming(page)
        render template: "movies/index"

      when "lives"
        @level = Movie.count_level(@page)
        @salons = Movie.disp_lives(@page)
        render template: "lives/index"

      when "phps"
        @php_movies = Movie.disp_phps
        render template: "phps/index"

      when "talks"
        @level = Movie.count_level(@page)
        @talks = Movie.disp_talks(@page)
        render template: "talks/index"

      when "marketings"
        page = params[:page]
        @level = Marketing.count_level(page)
        @marketings = Marketing.search_all_movie(page)
        render template: "marketings/index"

      when "videoedittings"
        @viedeoedittings = Movie.disp_modvieedittings
        render template: "videoedittings/index"

      when "writings"
        @writing_movies = Movie.disp_writings
        render template: "writings/index"
      end

    else
      page = params[:page]
      @level = Movie.count_level(page)
      @movies = Movie.disp_programming(page)
      render template: "movies/index"
    end
  end

end

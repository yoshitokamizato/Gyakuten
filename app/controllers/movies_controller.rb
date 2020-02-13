class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index

    case params[:content_name]
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

    when "videoedittings"
      @viedeoedittings = Movie.disp_modvieedittings
      render template: "videoedittings/index"

    when "writings"
      @writing_movies = Movie.disp_writings
      render template: "writings/index"

    # params[:content_name]がない場合は動画教材ページを表示する
    else
      page = params[:page]
      @level = Movie.count_level(page)
      @movies = Movie.disp_programming(page)
      render template: "movies/index"
    end
  end

  private

  def move_to_index
    flash[:error] = "ログインしてください" unless user_signed_in?
  end

  def get_page
    @page = params[:page]
  end

end

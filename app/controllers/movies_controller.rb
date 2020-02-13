class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @level = Movie.count_level(@page)
    @movies = categorized_movies
  end

  private

  def categorized_movies
    case params[:content_name]
    when "lives"
      Movie.disp_lives(@page)

    when "phps"
      Movie.disp_phps

    when "talks"
      Movie.disp_talks(@page)

    when "videoedittings"
      Movie.disp_modvieedittings

    when "writings"
      Movie.disp_writings

    # params[:content_name]がない場合は動画教材ページを表示する
    else
      Movie.disp_programming(@page)
    end
  end

  def move_to_index
    flash[:error] = "ログインしてください" unless user_signed_in?
  end

  def get_page
    @page = params[:page]
  end

end

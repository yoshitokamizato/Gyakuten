ActiveAdmin.register_page "MovieSort" do
  menu parent: "動画教材", label: "並び替え"
  page_action :update, method: :patch

  content do
    render partial: "admin/movies_sort"
  end

  controller do
    def index
      # 並び替え機能が正常に機能するように先に整頓を行う
      # 「ライブコーディング」「勉強会」は新規投稿順で固定する
      programming_movies = Movie.where(genre: Movie::PROGRAMMING).order(:position)
      general_movies = Movie.where(genre: Movie::GENERAL).order(:genre, :position)
      live_movies = Movie.where(genre: Movie::LIVE).order(:genre, id: :desc)
      all_movies = programming_movies + general_movies + live_movies
      all_movies.each.with_index(1) do |movie, index|
        movie.insert_at(index) if movie.position != index
      end
      @movies = programming_movies + general_movies
    end

    def update
      @movie = Movie.find_by(position: params[:from].to_i)
      @movie.insert_at(params[:to].to_i)
    end
  end
end

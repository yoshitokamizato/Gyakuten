ActiveAdmin.register_page "MovieSort" do
  # トップメニュー「動画教材」の下に「並び替え」という名前のドロップダウンを追加
  menu parent: "動画教材", label: "並び替え"
  PROGRAMMING = Settings.programming.rails.split(", ").freeze
  page_action :update, method: :patch

  content do
    render partial: "admin/movies_sort"
  end

  controller do
    def index
      @pre_movies = Movie.where(genre: PROGRAMMING).order(:position)
      @post_movies = Movie.where.not(genre: PROGRAMMING).order(:genre, :position)
      @movies = @pre_movies + @post_movies
      @movies.each.with_index(1) do |movie, index|
        movie.insert_at(index) if movie.position != index
      end
    end

    def update
      @movie = Movie.find_by(position: params[:from].to_i)
      @movie.insert_at(params[:to].to_i)
    end
  end
end

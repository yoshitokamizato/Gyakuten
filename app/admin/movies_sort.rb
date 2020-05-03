ActiveAdmin.register_page "MovieSort" do
  # トップメニュー「動画教材」の下に「並び替え」という名前のドロップダウンを追加
  menu parent: "動画教材", label: "並び替え"

  page_action :update, method: :patch

  content do
    render partial: "admin/movies_sort"
  end

  controller do
    def index
      @movies = Movie.order([:genre, :position])
      @rails_movie_ids = Movie.show_contents_list.ids
    end

    def update
      @movie = Movie.find_by(position: params[:from].to_i)
      @movie.insert_at(params[:to].to_i)
    end
  end
end

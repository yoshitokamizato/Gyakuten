class FormatUrlToMovies < ActiveRecord::Migration[5.2]
  def up
    Movie.all.each do |movie|
      movie.update!(url: YoutubeUrlFormatter.format(movie.url))
    end
  end
end

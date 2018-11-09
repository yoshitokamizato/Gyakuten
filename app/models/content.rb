class Content
  def self.build_objects
    movies = Movie.all.order("id ASC")
    texts = Text.all.order("id ASC")
    {movie: movies, text: texts}
  end
end

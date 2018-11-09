class Content
  def self.build_objects
    movies = Movie.all.order("id ASC")
    texts = Text.all.order("id ASC")
    lines = Line.all.order("id ASC")
    {movie: movies, text: texts, line: lines}
  end
end

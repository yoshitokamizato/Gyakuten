class Content
  def self.build_objects
    movies = Movie.order("id ASC")
    texts = Text.order("id ASC")
    lines = Line.order("id ASC")
    { movie: movies, text: texts, line: lines }
  end
end

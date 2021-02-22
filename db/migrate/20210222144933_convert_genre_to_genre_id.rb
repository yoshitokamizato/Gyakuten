class ConvertGenreToGenreId < ActiveRecord::Migration[5.2]
  def up
    genre_list = [
      "Basic",
      "Git",
      "Ruby",
      "Ruby on Rails",
      "PHP",
      "HTML&CSS",
      "JavaScript",
      "TypeScript",
      "Vue",
      "Angular",
      "AWS",
      "Money",
      "Talk",
      "Live",
      "Other"
    ]
    genre_list.each.with_index(1) do |genre, index|
      Movie.where(genre: genre).update(genre: index)
      Text.where(genre: genre).update(genre: index)
    end
  end
end

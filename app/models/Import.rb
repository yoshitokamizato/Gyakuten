require 'csv'

class Import

  def self.movie_data(path)
    Movie.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
          title: row["Title"],
          contents: row["Contents"],
          desc: row["Desc"],
          genre: row["Genre"]
      }
    end
    Movie.create!(data_list)
  end

end

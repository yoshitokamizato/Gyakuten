require 'csv'

class Import
  # rake import_csv:movie_data
  def self.movie_data(path = 'db/data/movies.csv')
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
    begin
      puts "start import"
      Movie.create!(data_list)
      puts "success import"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "failed import #{invalid}"
    end
  end

end

require 'csv'

class Import
  # rake import_csv:movie_data
  def self.movie_data
    path = Rails.root + 'db/data/movies.csv'
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
    puts "start import"
    Movie.create!(data_list)
    puts "success import"
  rescue ActiveModel::UnknownAttributeError => invalid
    puts "failed import #{invalid}"
  end

  # rake import_csv:text_data
  def self.text_data(path = 'db/data/text.csv')
    Text.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
          title: row["Title"],
          contents: row["Contents"],
          genre: row["Genre"]
      }
    end
    puts "start import"
    Text.create!(data_list)
    puts "success import"
  rescue ActiveModel::UnknownAttributeError => invalid
    puts "failed import #{invalid}"
  end

  # rake import_csv:money_data
  def self.money_data(path = 'db/data/money.csv')
    Money.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
          title: row["Title"],
          contents: row["Contents"],
          genre: row["Genre"]
      }
    end
    puts "start import"
    Money.create!(data_list)
    puts "success import"
  rescue ActiveModel::UnknownAttributeError => invalid
    puts "failed import #{invalid}"
  end

end

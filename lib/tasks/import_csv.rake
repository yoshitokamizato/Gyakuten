namespace :import_csv do
  desc "Movieデータをインポートする"
  task movie_data: :environment do
    puts "start import data of movie"
    Import.movie_data('db/data/movies.csv')
    puts "end import data of movie"
  end

end

namespace :import_csv do
  desc "Movieデータをインポートする"
  task movie_data: :environment do
    Import.movie_data('db/data/movies.csv'
    )
  end

end

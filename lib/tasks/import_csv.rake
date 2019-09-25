namespace :import_csv do
  desc "Movieデータをインポートする"
  task movie_data: :environment do
    Import.movie_data('db/data/movies.csv')
  end

  desc "Textデータをインポートする"
  task text_data: :environment do
    Import.text_data('db/data/texts.csv')
  end

end

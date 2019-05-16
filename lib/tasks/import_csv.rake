namespace :import_csv do
  desc "Movieデータをインポートする"
  task movie_data: :environment do
    Import.movie_data
  end

end

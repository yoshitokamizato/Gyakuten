namespace :import_csv do
  desc "Movieデータをインポートする"
  task movie_data: :environment do
    Import.movie_data("db/data/movies.csv")
  end

  desc "Textデータをインポートする"
  task text_data: :environment do
    Import.text_data("db/data/texts.csv")
  end

  desc "Questionデータをインポートする"
  task question_data: :environment do
    Import.question_data("db/data/questions.csv")
  end

  desc "Awsデータをインポートする"
  task aws_data: :environment do
    Import.aws_data("db/data/aws.csv")
  end

  desc "Lineデータをインポートする"
  task line_data: :environment do
    Import.line_data("db/data/line.csv")
  end
end

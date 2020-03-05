require "csv"

class Import
  # rake import_csv:movie_data
  def self.movie_data(path = "db/data/movies.csv")
    Movie.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        desc: row["Desc"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Movie.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:text_data
  def self.text_data(path = "db/data/texts.csv")
    Text.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Text.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:money_data
  def self.money_data(path = "db/data/money.csv")
    Money.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Money.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:question_data
  def self.question_data(path = "db/data/questions.csv")
    Question.delete_all
    question_data_list = []
    CSV.foreach(path, headers: true) do |row|
      question_data_list << {
        title: row["Title"],
        details: row["Details"],
      }
    end
    solution_data_list = []
    CSV.foreach(path, headers: true) do |row|
      solution_data_list << {
        solution: row["Solution"],
      }
    end
    Rails.logger.info "start import"
    Question.create!(question_data_list)
    Question.all.each_with_index do |question, i|
      question.solutions.create!(content: solution_data_list[i][:solution])
    end
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:aws_data
  def self.aws_data(path = "db/data/aws.csv")
    Aw.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
      }
    end
    Rails.logger.info "start import"
    Aw.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:line_data
  def self.line_data(path = "db/data/line.csv")
    Line.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Line.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end
end
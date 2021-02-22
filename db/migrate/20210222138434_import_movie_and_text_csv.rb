require "import_csv"

class ImportMovieAndTextCsv < ActiveRecord::Migration[5.2]
  def up
    ImportCsv.execute(model: Movie)
    ImportCsv.execute(model: Text)
  end
end

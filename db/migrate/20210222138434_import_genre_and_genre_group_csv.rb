require "import_csv"

class ImportGenreAndGenreGroupCsv < ActiveRecord::Migration[5.2]
  def up
    ImportCsv.execute(model: Genre)
    ImportCsv.execute(model: GenreGroup)
  end
end

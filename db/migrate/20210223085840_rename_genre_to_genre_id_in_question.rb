class RenameGenreToGenreIdInQuestion < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :questions, :genre, :genre_id
      change_column :questions, :genre_id, "integer USING CAST(genre_id AS integer)"
      add_foreign_key :question, :genres
      add_foreign_key :texts, :genres
    end
  end
end

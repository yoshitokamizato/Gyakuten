class AddTextIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :text_id, :integer
  end
end

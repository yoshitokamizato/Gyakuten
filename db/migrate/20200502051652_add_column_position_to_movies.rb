class AddColumnPositionToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :position, :integer
  end
end

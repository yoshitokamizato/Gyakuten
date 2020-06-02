class AddColumnPositionToMovies < ActiveRecord::Migration[5.2]
  def up
    add_column :movies, :position, :integer
    Movie.order(id: :asc).each.with_index(1) do |movie, index|
      movie.update(position: index)
    end
  end

  def down
    remove_column :movies, :position, :integer
  end
end

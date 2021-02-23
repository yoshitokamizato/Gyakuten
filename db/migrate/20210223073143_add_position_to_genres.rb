class AddPositionToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :position, :integer
  end
end

class AddPositionToGenreGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :genre_groups, :position, :integer
  end
end

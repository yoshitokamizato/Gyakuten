class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :contents
      t.text :desc
      t.timestamps
    end
  end
end

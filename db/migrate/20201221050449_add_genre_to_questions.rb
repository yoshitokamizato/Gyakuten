class AddGenreToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :genre, :string
    remove_column :questions, :count, :integer
  end
end

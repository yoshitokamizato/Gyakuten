class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :genre
      t.string :title
      t.text :contents
      t.timestamps
    end
  end
end

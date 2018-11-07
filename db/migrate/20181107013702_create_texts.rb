class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :genre
      t.text :title
      t.text :contents
      t.timestamps
    end
  end
end

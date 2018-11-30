class CreateMoney < ActiveRecord::Migration[5.2]
  def change
    create_table :money do |t|
      t.string :genre
      t.string :title
      t.text :contents
      t.timestamps
    end
  end
end

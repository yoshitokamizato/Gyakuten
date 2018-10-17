class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :about
      t.string :words
      t.timestamps
    end
  end
end

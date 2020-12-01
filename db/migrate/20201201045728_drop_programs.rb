class DropPrograms < ActiveRecord::Migration[5.2]
  def change
    drop_table :programs do |t|
      t.string :name
      t.timestamps
    end
  end
end

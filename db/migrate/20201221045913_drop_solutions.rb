class DropSolutions < ActiveRecord::Migration[5.2]
  def change
    drop_table :solutions do |t|
      t.integer :question_id, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end

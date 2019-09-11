class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.integer :question_id, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :details
      t.text :solution
      t.timestamps
    end
  end
end

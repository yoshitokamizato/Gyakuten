class CreateAws < ActiveRecord::Migration[5.2]
  def change
    create_table :aws do |t|
      t.string :title
      t.text :contents
      t.timestamps
    end
  end
end

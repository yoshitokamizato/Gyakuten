class CreateErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :errors do |t|
      t.string :name
      t.integer :program_id
      t.timestamps
    end
  end
end

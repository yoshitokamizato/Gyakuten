class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :program_id
      t.integer :error_id
      t.timestamps
    end
  end
end

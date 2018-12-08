class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :program_id
      t.integer :error_id
      t.timestamps
    end

    add_index :users, :program_id
    add_index :users, :error_id
  end
end

class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :program_id
    remove_column :users, :error_id
    remove_column :users, :name
  end

  def down
    add_column :users, :program_id, :integer
    add_column :users, :error_id, :integer
    add_column :users, :name, :string
  end
end

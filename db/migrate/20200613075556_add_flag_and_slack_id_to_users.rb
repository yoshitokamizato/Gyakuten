class AddFlagAndSlackIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :flag, :boolean, default: false
    add_column :users, :slack_id, :string, null: false
    add_index :users, :slack_id, unique: true
  end
end

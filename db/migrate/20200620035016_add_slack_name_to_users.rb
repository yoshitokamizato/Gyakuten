class AddSlackNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slack_name, :string
  end
end

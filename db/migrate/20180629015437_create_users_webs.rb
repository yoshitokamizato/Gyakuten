class CreateUsersWebs < ActiveRecord::Migration[5.2]
  def change
    create_table :users_webs do |t|
      t.text :url
      t.timestamps
    end
  end
end

class CreateSlackMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_members do |t|
      t.string :genre, null: false
      t.string :userid, null: false
      t.string :username
      t.string :fullname
      t.string :displayname
      t.string :status, null: false

      t.timestamps
    end
    add_index :slack_members, :userid, unique: true
  end
end

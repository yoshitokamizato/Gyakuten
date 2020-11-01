class DropTableAws < ActiveRecord::Migration[5.2]
  def change
    drop_table :aws
  end
end

class AddApprovalAtTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :approval_at, :datetime, default: Time.current
  end
end

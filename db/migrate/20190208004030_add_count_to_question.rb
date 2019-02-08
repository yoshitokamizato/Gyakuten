class AddCountToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :count, :integer, default: 0
  end
end

class RemoveTwitterImageFromTexts < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :twitter_image, :string
  end
end

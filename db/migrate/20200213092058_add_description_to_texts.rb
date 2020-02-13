class AddDescriptionToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :description, :string
    add_column :texts, :twitter_image, :string
  end
end

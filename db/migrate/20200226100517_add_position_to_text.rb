class AddPositionToText < ActiveRecord::Migration[5.2]
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails"].freeze

  def up
    add_column :texts, :position, :integer
    ActiveRecord::Base.transaction do
      Text.show_contents_list.order("id ASC").each do |text|
        text.send :add_to_list_bottom
        text.save!
      end
    end
  end

  def down
    remove_column :texts, :position
  end
end
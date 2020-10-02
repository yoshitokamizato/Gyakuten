class AddPositionToText < ActiveRecord::Migration[5.2]
  def up
    add_column :texts, :position, :integer
    ActiveRecord::Base.transaction do
      rails_texts = Text.where(genre: Text::PROGRAMMING).order("id ASC")
      rails_texts_ids = rails_texts.ids
      other_texts = Text.where.not(id: rails_texts_ids).order("id ASC")

      rails_texts.each.with_index(1) do |text, index|
        text.position = index
        text.save!
      end

      other_texts.each.with_index(rails_texts_ids.count + 1) do |text, index|
        text.position = index
        text.save!
      end
    end
  end

  def down
    remove_column :texts, :position
  end
end

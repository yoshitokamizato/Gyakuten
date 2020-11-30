class CreateCompleteChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :complete_challenges do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end

class MigrateMarketingsToMovies < ActiveRecord::Migration[5.2]
  def up
    marketings = Marketing.all

    ActiveRecord::Base.transaction do
      marketings.each do |marketing|
        Movie.create!(marketing.attributes.slice("genre", "title", "contents"))
      end
    end
  end

  def down
  end
end

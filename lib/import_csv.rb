require "csv"

class ImportCsv
  def self.execute(model:)
    model_name = model.to_s.classify
    table_name = model_name.tableize
    path = Rails.root.join("db/csv_data/#{table_name.singularize}.csv")

    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    # 与えられたモデルに CSVデータを投入
    model_name.constantize.import!(list)
    # 次に振る id を正常化
    ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',(select max(id) from #{table_name}))")
  end
end
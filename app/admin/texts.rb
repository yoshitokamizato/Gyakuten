ActiveAdmin.register Text do

  # ドロップダウンメニューの親成分を決定
  menu parent: "テキスト教材"
  permit_params :genre, :title, :contents, :image, :description
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    column :description
    actions
  end

  show do
    attributes_table do
      row :position
      row :genre
      row :title
      row :contents
      row :image
      row :description
    end
  end

  form do |_f|
    inputs  do
      input :position
      input :genre, as: :select, collection: Text::ALL_PROGRAMMING
      input :title, as: :string
      input :contents
      input :image, as: :file
      input :description
    end

    actions
  end
end

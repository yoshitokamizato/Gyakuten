ActiveAdmin.register Text do
  # ドロップダウンメニューの親成分を決定
  menu parent: "テキスト教材"
  permit_params :genre, :title, :contents, :image, :description
  config.sort_order = "id_asc"

  index do
    selectable_column
    id_column
    column :genre
    column :title
    column :contents
    column :description
    actions
  end

  show do
    attributes_table do
      row :genre
      row :title
      row :contents
      row :image do |r|
        if r.image.attached?
          image_tag url_for(r.image)
        end
      end
      row :description
    end
  end

  form do |_f|
    inputs  do
      input :genre, as: :select, collection: ["Basic", "Ruby", "Ruby on Rails"]
      input :title, as: :string
      input :contents
      input :image, as: :file
      input :description
    end

    actions
  end
end

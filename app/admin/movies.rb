ActiveAdmin.register Movie do
  permit_params :title, :url, :desc, :genre, :text_id
  menu parent: "動画教材"
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    column :text_id
    actions
  end

  form do |_f|
    inputs do
      input :position
      input :text
      input :genre, as: :select, collection: Movie::MYPAGE_LIST
      input :title
      input :url
      input :desc
    end

    actions
  end
end

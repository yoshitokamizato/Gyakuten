ActiveAdmin.register Movie do
  permit_params :title, :contents, :desc, :genre
  menu parent: "動画教材"
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    actions
  end
end

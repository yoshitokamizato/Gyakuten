ActiveAdmin.register Movie do
  permit_params :title, :contents, :desc, :genre
  menu parent: "動画教材"
end

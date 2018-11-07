ActiveAdmin.register Movie do
  permit_params :title, :contents, :desc
end

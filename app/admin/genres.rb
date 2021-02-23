ActiveAdmin.register Genre do
  permit_params :position, :genre_group_id, :title, :color
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre_group
    column :title
    actions
  end

  show do
    attributes_table do
      row :position
      row :genre
      row :title
      row :color
    end
  end

  form do |f|
    f.object.position ||= Genre.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :genre_group
      input :title
      input :color
    end
    f.actions
  end
end

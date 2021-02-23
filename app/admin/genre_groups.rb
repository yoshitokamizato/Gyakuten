ActiveAdmin.register GenreGroup do
  permit_params :position, :title
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :title
    actions
  end

  show do
    attributes_table do
      row :position
      row :title
    end
  end

  form do |f|
    f.object.position ||= GenreGroup.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :title
    end
    f.actions
  end
end

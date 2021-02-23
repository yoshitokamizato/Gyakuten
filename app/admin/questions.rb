ActiveAdmin.register Question do
  permit_params :genre, :title, :body, :solution

  index do
    selectable_column
    column :genre
    column :title
    actions
  end

  show do
    attributes_table do
      row :genre
      row :title
      row :body
      row :solution
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :genre, as: :select, collection: Genre.pluck(:title)
      input :title
      input :body
      input :solution
    end
    f.actions
  end
end

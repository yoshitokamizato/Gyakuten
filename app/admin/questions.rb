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

  form do |_f|
    inputs  do
      input :genre, as: :select, collection: Text::ALL_PROGRAMMING
      input :title
      input :body
      input :solution
    end

    actions
  end
end

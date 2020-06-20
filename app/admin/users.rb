ActiveAdmin.register User do
  permit_params :email, :slack_id, :flag

  index do
    selectable_column
    id_column
    column :flag
    column :slack_id
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :flag
  filter :slack_id
  filter :email
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.inputs do
      f.input :flag
      f.input :email
      f.input :slack_id
    end
    f.actions
  end
end

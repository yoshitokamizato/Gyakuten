ActiveAdmin.register Question do
  permit_params :title, :details, :solution
end

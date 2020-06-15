ActiveAdmin.register SlackMember do
  active_admin_import
  permit_params :genre, :userid, :status, :username, :fullname, :displayname
end

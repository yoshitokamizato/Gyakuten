ActiveAdmin.register SlackMember do
  permit_params :genre, :userid, :status, :username, :fullname, :displayname
end

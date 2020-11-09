ActiveAdmin.register Project do
  menu parent: "System"
  permit_params :name
end

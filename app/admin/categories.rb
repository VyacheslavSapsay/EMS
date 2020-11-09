ActiveAdmin.register Category do
  menu parent: "System"
  permit_params :name
end

ActiveAdmin.register AdminUser do
  config.sort_order = 'last_name_asc'
  
  permit_params :email, :first_name, :last_name, :password, :password_confirmation

  filter :email
  filter :first_name
  filter :last_name
  filter :created_at

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    actions
  end

  show do
    attributes_table do
      row :email
      row :full_name do
        "#{admin_user.first_name} #{admin_user.last_name}"
      end
    end
  end

  form title: 'A custom title' do |f|
    inputs 'Info' do
      input :email
      input :first_name
      input :last_name
      input :password
      actions
    end
  end

  sidebar :details, only: :show do
    attributes_table do
      row :created_at
      row :updated_at
    end
  end
end

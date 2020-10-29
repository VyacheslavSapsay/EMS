ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name

  filter :email
  filter :first_name
  filter :last_name
  filter :created_at

  config.sort_order = 'last_name_asc'

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
      input :first_name, label: "First name"
      input :last_name, label: "Last name"
      input :password, label: "Password"
      actions
    end
  end

  sidebar :Details, only: :show do
    attributes_table do
      row :created_at
      row :updated_at
    end
  end

end

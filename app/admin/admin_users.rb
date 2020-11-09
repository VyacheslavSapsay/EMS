ActiveAdmin.register AdminUser do
  config.sort_order = 'last_name_asc'

  menu parent: "System"

  permit_params :email, :first_name, :last_name, :password,
    :password_confirmation, :role

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
        admin_user.display_name
      end
      row :role
    end
  end

  form title: 'Form' do |f|
    inputs 'Info' do
      input :email
      input :first_name
      input :last_name
      input :role if current_admin_user.super?
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

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
end

ActiveAdmin.register User do

  filter :email
  filter :first_name
  filter :last_name

  show do
    attributes_table do
      row :email
      row :full_name do
        "#{user.first_name} #{user.last_name}"
      end
      row :encrypted_password
      row :reset_password_token
      row :created_at
      row :updated_at
    end
  end

  form title: 'A custom title' do |f|
    inputs 'Info' do
      input :email
      input :first_name, label: "First name"
      input :last_name, label: "Last name"
      datetime_select :created_at, label: "Created at"
    end
  end

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    actions
  end
end

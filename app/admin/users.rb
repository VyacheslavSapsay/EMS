ActiveAdmin.register User do


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
end

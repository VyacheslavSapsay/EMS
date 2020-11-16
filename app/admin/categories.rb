ActiveAdmin.register Category do
  menu parent: 'System'

  permit_params do
    Pundit.policy(current_admin_user, Category).permitted_attributes
  end
end

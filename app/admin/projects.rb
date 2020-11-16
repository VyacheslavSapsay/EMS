ActiveAdmin.register Project do
  menu parent: 'System'

  permit_params do
    Pundit.policy(current_admin_user, Project).permitted_attributes
  end
end

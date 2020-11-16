ActiveAdmin.register Agent do
  menu parent: 'System'

  permit_params do
    Pundit.policy(current_admin_user, Agent).permitted_attributes
  end
end

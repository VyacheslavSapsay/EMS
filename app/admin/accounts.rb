ActiveAdmin.register Account do
  menu priority: 2

  permit_params do
    Pundit.policy(current_admin_user, Account).permitted_attributes
  end
end

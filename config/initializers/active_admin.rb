ActiveAdmin.setup do |config|
  config.site_title = "Ems"
  config.authentication_method = :authenticate_admin_user!
  config.authorization_adapter = ActiveAdmin::PunditAdapter
  config.pundit_default_policy = "ApplicationPolicy"
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.comments = false
  config.comments_menu = false
  config.batch_actions = true
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  config.localize_format = :long
end

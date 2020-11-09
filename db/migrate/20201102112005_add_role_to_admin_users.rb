class AddRoleToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :role, :string, default: "user"
    add_index :admin_users, :role
  end
end

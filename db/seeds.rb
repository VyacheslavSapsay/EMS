AdminUser.create!(
  email: 'admin@example.com',
  first_name: 'Admin',
  last_name: 'Admin',
  password: 'password',
  password_confirmation: 'password',
  role: 'super')

AdminUser.create!(
  email: 'user@example.com',
  first_name: 'User',
  last_name: 'User',
  password: 'password',
  password_confirmation: 'password')

Account.create!(name: 'Account1')
Agent.create!(name: 'Agent1')
Category.create!(name: 'Category1')
Project.create!(name: 'Project1')

AdminUser.create!(
  email: 'admin@example.com',
  first_name: 'Admin',
  last_name: 'Admin',
  password: 'password',
  password_confirmation: 'password')

AdminUser.create!(
  email: 'user@example.com',
  first_name: 'User',
  last_name: 'User',
  password: 'password',
  password_confirmation: 'password')

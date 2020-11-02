class AdminUser < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name

  enumerize :role, in: %i[super user]

  def display_name
    "#{first_name} #{last_name}"
  end
end

class AdminUser < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  enumerize :role, in: %i[super user], predicates: true

  def display_name
    "#{first_name} #{last_name}"
  end
end

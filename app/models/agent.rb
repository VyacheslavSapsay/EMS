class Agent < ApplicationRecord
  has_many :transactions
  validates :name, presence: true
end
